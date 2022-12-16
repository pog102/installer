import numpy
from matplotlib import pyplot as plt
for i in range(0,9):
    file = str(i)
    f= open(file +".csv","r")
    l = [[int(elementai) for elementai in eilute.split(';')] for eilute in f]
    plt.axis('off')
    plt.imshow(l)
    plt.savefig(file+'.png', bbox_inches='tight', pad_inches=0)
    plt.show()

