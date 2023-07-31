import cv2
import numpy as np
import math
from cvzone.HandTrackingModule import HandDetector
from cvzone.ClassificationModule import Classifier
from csv import reader

#cap=cv2.VideoCapture(0)
cap = cv2.VideoCapture('Videos/deaf.mp4')
detector = HandDetector(maxHands=1)
classifier = Classifier('Model/keras_model.h5','Model/labels.txt')

offset = 20
percent = 0
imgSize = 300

folder = 'Data/abortion'
counter = 0

labels = ['abortion','AIDS','allergy','allergy1','amblyopia','anorexia','anus','arm-pain','astigmatism','belly','bladder','blisters','blurry','burning-eyes',
          'burning-nose','burning-pain','cannotsleep','cant-swallow','chest-tightness','cold','conjunctivitis','constipation','cough','cramp','diarrhea',
          'dizzy','dizzy1','drug-allergy','easily-tired','eat','epilepsy','Filling','flatulence','food','gasp','have-a-fever','headache','heart','high-blood-pressure',
          'highfever','hot-cold','hurt','jaw-pain','look','not-eating','Numbness','sick','sneeze','snot','squeamish','stomach','stomach ache','stressed','swell',
          'tired','Trembling','vehicle','vomit','weather','wet-eyes']

while True:
    success, img = cap.read()
    imgOutput = img.copy()
    hands, img = detector.findHands(img)
    if hands:
        hand = hands[0]
        x, y, w, h = hand['bbox']

        imgWhite = np.ones((imgSize,imgSize,3),np.uint8)*255
        imgCrop = img[y - offset:y + h + offset, x - offset:x + w + offset]

        imgCropShape = imgCrop.shape

        aspectRatio = h/w

        if aspectRatio > 1:
            k = imgSize / h
            wCal = math.ceil(k * w)
            imgResize = cv2.resize(imgCrop, (wCal , imgSize))
            imgResizeShape = imgResize.shape
            wGap = math.ceil((imgSize-wCal)/2)
            imgWhite[:, wGap:wCal + wGap] = imgResize
            prediction, index = classifier.getPrediction(imgWhite, draw=False)
            

        else:
            k = imgSize / w
            hCal = math.ceil(k * h)
            imgResize = cv2.resize(imgCrop, (imgSize, hCal))
            imgResizeShape = imgResize.shape
            hGap = math.ceil((imgSize-hCal)/2)
            imgWhite[hGap:hCal + hGap, :] = imgResize
            prediction, index = classifier.getPrediction(imgWhite,draw=False)

        cv2.rectangle(imgOutput,(x- offset-50 , y- offset-40), (x- offset+130, y- offset+ 10) , (255,0,255) ,cv2.FILLED)
        cv2.rectangle(imgOutput,(x- offset , y- offset), (x + w+ offset, y + h+ offset) , (255,0,255) ,4)

        if index < len(labels):
            cv2.putText(imgOutput, labels[index], (x - 10, y - 26), cv2.FONT_HERSHEY_COMPLEX, 2, (255, 255, 255), 2)
        else:
            cv2.putText(imgOutput, 'Unknown', (x - 10, y - 26), cv2.FONT_HERSHEY_COMPLEX, 2, (255, 255, 255), 2)

        cv2.imshow("ImageCrop", imgCrop)
        cv2.imshow("ImageWhite", imgWhite)

    cv2.imshow("Image", imgOutput)
    cv2.waitKey(10)
