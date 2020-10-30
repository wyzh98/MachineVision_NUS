function b = segment(img)  
% Q3. Segment the image to separate and identify the different characters
%% Check connectivity
[m, n]=size(img);
tmp = zeros(m, n);
label = 1;
queue_head = 1;
queue_tail = 1;
neighbour = [-1 0; 0 -1; 0 1; 1 0]; 
for i = 2:m-1
    for j = 2:n-1
        if img(i, j) == 1 && tmp(i, j) == 0           
            tmp(i, j) = label;
            q{queue_tail} = [i j];
            queue_tail = queue_tail + 1;
            imin = i;
            imax = i;
            jmin = j;
            jmax = j;
            while queue_head ~= queue_tail
                pix = q{queue_head};                
                for k = 1:4
                    pix1=pix+neighbour(k,:);
                    if pix1(1) >= 2 && pix1(1) <= m-1 && pix1(2) >= 2 && pix1(2) <= n-1
                        if img(pix1(1), pix1(2)) == 1 && tmp(pix1(1), pix1(2)) == 0
                            tmp(pix1(1), pix1(2)) = label;
                            q{queue_tail} = [pix1(1) pix1(2)];
                            queue_tail = queue_tail + 1;
                        end
                    end
                end
                queue_head = queue_head + 1;
            end
            for r = 1:queue_head-1
                imin = min(imin, q{r}(1));
                imax = max(imax, q{r}(1));
                jmin = min(jmin, q{r}(2));
                jmax = max(jmax, q{r}(2));
            end
            b{label} = [imin imax jmin jmax];
            clear q;
            label = label + 1;
            queue_head = 1;
            queue_tail = 1;            
        end
    end
end
%% Check if the borders have overlapping
invalid = [];
for j = 1:size(b, 2)
    for i = 1:j
        if (b{i}(1) < b{j}(1) && b{j}(1) < b{i}(2) && b{i}(3) < b{j}(3) && b{j}(3) < b{i}(4)) || ...
            (b{i}(1) < b{j}(1) && b{j}(1) < b{i}(2) && b{i}(3) < b{j}(4) && b{j}(4) < b{i}(4)) || ...
            (b{i}(1) < b{j}(2) && b{j}(2) < b{i}(2) && b{i}(3) < b{j}(3) && b{j}(3) < b{i}(4)) || ...
            (b{i}(1) < b{j}(2) && b{j}(2) < b{i}(2) && b{i}(3) < b{j}(4) && b{j}(4) < b{i}(4))
            invalid = [invalid j];
        end
    end
end
for k = 1: size(invalid, 2)
    b(:, invalid(k)) = [];
end
%% Split the connected characters
num = size(b, 2);
for k = 2:num
    if (b{k}(4) - b{k}(3) > 2*(b{k}(2) - b{k}(1)))
        add = round((b{k}(4) - b{k}(3) + 1) / 3);
        for n = 1:3
            b{num+n}(1) = b{k}(1);
            b{num+n}(2) = b{k}(2);
            b{num+n}(3) = b{k}(3)+(n-1)*add;
            b{num+n}(4) = b{k}(4)-(3-n)*add;  
        end
        b(:,k)=[];
    end
end
num = size(b, 2);
for k = 2:num
    if b{k}(4)-b{k}(3) > (b{k}(2) - b{k}(1))
        add = round((b{k}(4) - b{k}(3) + 1) / 2);
        for n = 1:2
            b{num+n}(1) = b{k}(1);
            b{num+n}(2) = b{k}(2);
            b{num+n}(3) = b{k}(3) + (n-1)*add;
            b{num+n}(4) = b{k}(4) - (2-n)*add;          
        end
        b(:, k) = [];
    end
end

%% Show the segmented images
figure();
for i = 1:size(b, 2)
    seg = img(b{i}(1):b{i}(2), b{i}(3):b{i}(4));
    imgSeg{i} = seg;
    subplot(4,5,i);
    imshow(seg, 'InitialMagnification', 'fit');
end

