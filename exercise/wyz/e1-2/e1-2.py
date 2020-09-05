import numpy as np
import matplotlib.pyplot as plt


def intensityDistrib():
    K = 255
    scale = 100
    area = np.zeros([256, 256])
    for i in range(256):
        for j in range(256):
            x = (i - 128) / scale
            y = (j - 128) / scale
            area[i][j] = K * np.exp(-(x**2 + y**2))
    return area

def setLevel(area, level:int):
    area_thr = np.zeros([256, 256])
    length = np.max(area) / level
    for i in range(level):
        area_thr += (i+1) * length * (area > i*length) * (area <= (i+1)*length)
    return area_thr
    

def main():
    n = 4 # input your intensity here
    level = 2 ** n
    area = setLevel(intensityDistrib(), level)
    plt.imshow(area, cmap='gray')
    plt.colorbar()
    plt.title('Intensity level: ' + str(level))
    plt.show()


if __name__ == '__main__':
    main()
