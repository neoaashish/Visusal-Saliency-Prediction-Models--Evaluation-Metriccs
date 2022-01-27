import numpy as np
import cv2
import xlsxwriter


outWorkbook = xlsxwriter.Workbook("out.xlsx") #create file and worksheet below
outSheet = outWorkbook.add_worksheet()



class Metrics:
    def __init__(self, salmap, fixpts, othermap = None, baseline = None,
                 jitter = True, step = 0.1, num_splits = 100, sub_sample = 1/32.0):
        self.salmap = salmap
        self.fixpts = fixpts
        
        self.othermap = othermap
        self.jitter = jitter
        self.step = step
        self.num_splits = num_splits
        self.sub_sample = sub_sample


    def AUC_Judd(self):
        if len(self.salmap.shape) == 3 and self.salmap.shape[2] == 3:
            self.salmap = np.mean(self.salmap, axis = 2)
            self.fixpts = np.mean(self.fixpts, axis = 2)

        if self.jitter == True:
            self.salmap = self.salmap + np.random.random(np.shape(self.salmap)) / 10 ** 7

        if self.salmap.shape != self.fixpts.shape:
            self.salmap = cv2.resize(self.salmap, (self.fixpts.shape[::-1]))

        self.salmap = (self.salmap - self.salmap.min()) / (self.salmap.max() - self.salmap.min())

        sal = self.salmap.flatten()
        fix = self.fixpts.flatten()

        val = sal[fix > 0]
        fix_num = len(val)
        pix_num = len(sal)

        thresholds = -np.sort(-val)

        tp = np.zeros(fix_num + 2)
        fp = np.zeros(fix_num + 2)

        tp[0], tp[-1] = 0, 1
        fp[0], fp[-1] = 0, 1

        for i in range(fix_num):
            thresh = thresholds[i]
            above_thresh = (sal >= thresh).sum()
            tp[i + 1] = (i + 1) / fix_num
            fp[i + 1] = (above_thresh - i + 1) / (pix_num - fix_num)

        return np.trapz(tp, fp)



if __name__=="__main__":

    n = 1;
    
    while True:

        #TD_BU_WITH_CB

        salmap1 = cv2.imread(str(n) + '_DEEPFEAT_WITH_CB' + '.jpg');
        fixpts = cv2.imread(str(n) + '_fixPts' + '.jpg');
        #cv2.imshow("original",image)
        #cv2.waitKey()



        dfff = Metrics(salmap1, fixpts)
        final1 = dfff.AUC_Judd()

        outSheet.write('A'+str(n), final1)

        #print(final1)
        #sum = sum + final;



        #TD_BU_NO_CB

        salmap2 = cv2.imread(str(n) + '_TD_BU_NO_CB' + '.jpg');
        fixpts = cv2.imread(str(n) + '_fixPts' + '.jpg');
        #cv2.imshow("original",image)
        #cv2.waitKey()



        dfff = Metrics(salmap2, fixpts)
        final2 = dfff.AUC_Judd()

        outSheet.write('C'+str(n), final2)

        #print(final2)
        #sum = sum + final;


        #BU

        salmap3 = cv2.imread(str(n) + '_BU' + '.jpg');
        fixpts = cv2.imread(str(n) + '_fixPts' + '.jpg');
        #cv2.imshow("original",image)
        #cv2.waitKey()



        dfff = Metrics(salmap3, fixpts)
        final3 = dfff.AUC_Judd()

        outSheet.write('E'+str(n), final3)

        #print(final3)
        #sum = sum + final;



        #TD

        salmap4 = cv2.imread(str(n) + '_TD' + '.jpg');
        fixpts = cv2.imread(str(n) + '_fixPts' + '.jpg');
        #cv2.imshow("original",image)
        #cv2.waitKey()



        dfff = Metrics(salmap4, fixpts)
        final4 = dfff.AUC_Judd()

        outSheet.write('G'+str(n), final4)

        #print(final2)
        #sum = sum + final;        

        n = n + 1;
        if n == 76:
            break


outWorkbook.close()           
        


    




