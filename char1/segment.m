function border = segment(img)  
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
            border{label} = [imin imax jmin jmax];
            clear q;
            label = label + 1;
            queue_head = 1;
            queue_tail = 1;            
        end
    end
end
%% Show the segmented images
[~, b] = size(border);
figure();
for i = 1:b
    seg = img(border{i}(1):border{i}(2), border{i}(3):border{i}(4));
    seg_image{i} = seg;
    subplot(2,3,i);
    imshow(seg, 'InitialMagnification', 'fit')
end


