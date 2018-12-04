#OverPyLay

#Created 7-15-2018
#By Owen Cody

#This script is made to create an Overwatch overlay similar to those
#used on Twitch streams to improve the game experience for those playing
#healer characters

'''Grabs the Necessary Imports'''
import numpy as np
import cv2
from PIL import ImageGrab,Image
import time

'''Takes the Screenshot'''
#Take an initial screenshot with ImageGrab! & find the picture resolution
img=ImageGrab.grab()#bbox formatting for Image Grab(x,y,x+w,y+h)
snapSize=img.size#Get the picture resolution

'''Function Declarations'''
#function to easily create a rectangular bounding box
#an input example would be getRectBoundingBox(100,200,0.75,0.75,snapSize)
#creates a 200 x 400 box at 3/4 way towards the bottom right of the screen
def getRectBoundingBox(wDim,hDim,widthMod,heightMod,snapSize):
    wDim=int(wDim/2) #Halves the inputed dimensions so the size of the
    hDim=int(hDim/2) #Bounding boxes will not be doubled.
    selW=int(snapSize[0]*widthMod) #Finds the x and y position of the center
    selH=int(snapSize[1]*heightMod) #by applying multiplier to dimensions.
    #Calculates the appropropriate top left and bottom right coordinates
    boundBox=((selW-wDim),(selH-hDim),(selW+wDim),(selH+hDim))
    #Checks to ensure the bounding box is still on the screen ;D
    if(not((boundBox[0] and boundBox[1] >0)and(boundBox[2]<snapSize[0])
           and(boundBox[3]<snapSize[1]))):
        #Throws an error to the console
        print('''You have encountered a bounding box location error:\n
Please change the size or location of your bounding box
to fix this error and change screen size back to normal''')
        return None #Returns None to avoid a crash is failed
    return boundBox #Returns the correct coordinates for the bounding box


#function to easily create a square bounding box
#an input example would be getSquareBoundingBox(100,0.5,0.5,snapSize)
#creates a 200 x 200 box at 1/2 way towards the bottom right of the screen
def getSquareBoundingBox(boxDim,widthMod,heightMod,snapSize):
    #Literally just the Rect function but width and height are the same XD
    return(getRectBoundingBox(boxDim,boxDim,widthMod,heightMod,snapSize))

'''Actual Code'''
selection=img.crop(getRectBoundingBox(150,150,0.75,0.75,snapSize))
img_np = np.array(selection)

count=750
while count<1000:
    img=ImageGrab.grab()#bbox formatting for Image Grab(x,y,x+w,y+h)
    img_np = np.array(img)
    frame = cv2.cvtColor(img_np, cv2.COLOR_RGB2BGR)
    cv2.imwrite("trainingImage"+str(count)+".jpg",frame)
    time.sleep(10)
    count=count+1

#cv2.imshow("frame", frame)
#print img_np[0,0]
#cv2.waitKey(0)
#cv2.destroyAllWindows()
