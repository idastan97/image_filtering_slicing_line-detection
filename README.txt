This is homework 2 solutions in course Digital Image Processing. The description of problems are in file "hw2.pdf". The source code files:

    - "hw2_1.m" - solution for task 1. Slices the input gray image.
        Input:
            Reads gray image file "gray_image.jpg" from the same directory.
        Output:
            Creates 8 image files "bit<k>.tif" in the same directory, where <k> - appropriate bit from slicing.
            Shows 8 images concatenated together in one figure using imshow.
        slice function from "slice.m" was used to separate bit planes.

    - "hw2_2.m" - solution for task 2. Generates new images from the most significant 2 and 3 bits of the input  gray image. 
        Input:
            Reads gray image file "gray_image.jpg" in the same directory.
        Output:
            Creates 2 files "most2bits.jpg" and "most3bits.jpg", images generated from most significant 2 and 3 bits of input image respectively.
            Shows 2 figures: images generated from most significant 2 and 3 bits of input image respectively.
        slice function from "slice.m" was used to separate bit planes.

    - "hw2_3.m" - solution for task 3. Applies filtering on the input image.
        Input:
            Reads gray image file "gray_image.jpg" in the same directory.
        Output:
            Creates file "filtered.jpg", the filtered image.
            Shows image: filtered image.
        filtering function from "filtering.m" was used to apply the given mask on the input image.

    - "hw2_4.m" - solution for task 4. Applies Sobel edge detection on the input image by filtering with vertical and horizontal edge detection masks.
        Input:
            Reads gray image file "gray_image.jpg" in the same directory.
        Output:
            Creates file "sobel.jpg", the merge of two images from filtering by horizontal and vertical edge detection masks.
            Shows image: the merge of two images from filtering by horizontal and vertical edge detection masks.
        filtering function from "filtering.m" was used to apply the given mask on the input image.
        The threshold for the edge pixels was set to 128. 

    - "hw2_5.m" - solution for task 5. Applies Laplacian edge detection on the input image.
        Input:
            Reads gray image file "gray_image.jpg" in the same directory.
        Output:
            Creates file "laplacian.jpg", the filtered image.
            Shows image: the filtered image.
        filtering function from "filtering.m" was used to apply the given mask on the input image.
        The threshold for the edge pixels was set to 128. 

    - "hw2_6.m" - solution for task 6. Applies Sobel edge detection on the input image and shows the lines.
        Input:
            Reads gray image file "gray_image.jpg" in the same directory.
        Output:
            Creates file "lines.jpg" (rgb image) where the lines are shown with red color.
            Shows rgb image where the lines are shown with red color.
        filtering function from "filtering.m" was used to apply the given mask on the input image.

    - "getBits" - helper function. Converts 8 bit integer to array of 8 bits, integer in base 2.
        arr = getBits(num)
        Input:
            num: 8 bit integer.
        Output:
            arr: array of 0's and 1's, the form of the input integer in base 2.

    - "slice.m" - helper function.
        zI = slice(I)
        Input:
            I: gray image.
        Output:
            zI: array of matrixes of the same size as I, the bit planes of I.

    - "filtering.m" - helper function. Applies the filtering with the given mask on the input image.
        zI = filtering(I, mask)
        Input:
            I: gray image.
            mask: mask matrix. The number of rows and columns must be odd number.
        Output:
            zI: matrix of the same size as I, the filtered image. The elements of this matrix are float numbers.
