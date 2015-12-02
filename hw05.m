% CMSC733 HW05

numImages = 100;
imgs = cell(1, numImages);
sigma = 6.5;
T = 1e-5;

for i = 1:numImages
    imgs{i} = rgb2gray(imread(sprintf('imgs/b%.5d.bmp', i - 1)));
end

imgj = rgb2gray(imread('imgs/foreground_image.bmp'));

[s_y, s_x] = size(imgs{1});
%Don't Recompute this every time
c = 100*sigma*sqrt(2*pi);
v = 2*sigma^2;
result = zeros(s_y, s_x);

for p_x = 1:s_x
    for p_y = 1:s_y
        k = double(imgj(p_y, p_x));
        sum = 0;
        for img_n = 1:numImages
            I = imgs{img_n};
            i = double(I(p_y, p_x));
            sum = sum + exp(-(k - i)^2/v)/c;
        end
        if(sum < T)
            result(p_y, p_x) = 1;
        end
    end
end

imshow(result);

    
    
    
    