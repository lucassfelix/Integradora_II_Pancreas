import os
import csv
from PIL import Image

fp = "\"Falso Positivo\""
fn = "\"Falso Negativo\""
vp = "\"Verdadeiro Positivo\""

allr = 0
allg = 0
ally = 0

i = 1

pasta = os.getcwd()

for filename in os.listdir(pasta):
    if filename.endswith(".png"):
        im = Image.open(filename)

        i += 1

        red = 0
        yellow = 0
        green = 0

        for pixel in im.getdata():
            if pixel == (255,0,0):
                red += 1
                allr += 1
            if pixel == (0,255,0):
                green += 1
                allg += 1
            if pixel == (255,255,0):
                yellow += 1
                ally += 1
        
        with open(filename.split('.')[0] + ".dat", 'w' , newline='' ) as file:
            file.write("0 " + fp + " " + str(round(green)) +"\n")
            file.write("1 " + fn + " " +str(round(red))+"\n")
            file.write("2 " + vp + " " +str(round(yellow))+"\n")

allg = allg/i
allr = allr/i
ally = ally/i

with open("media.dat", 'w' , newline='' ) as file:
    file.write("0 " + fp + " " + str(round(allg)) +"\n")
    file.write("1 " + fn + " " +str(round(allr))+"\n")
    file.write("2 " + vp + " " +str(round(ally))+"\n")


    
