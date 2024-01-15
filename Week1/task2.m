% Load the file 'problem2.mat' using the load function without assigning its output to any variable. The workspace will then contain the vector 'v' of integers needed for this problem

load('problem2.mat');

% Write a for loop that computes the sum of the elements in v, and stores it to the variable 's'
s = 0;

for num=1:length(v);
    s=s+v(num);
end

% Calculate the same sum using the 'sum' function instead of a loop, and store the result into 'ss'

ss=sum(v);

% Calculate the sum of squares of the elements in v using the 'sum' function and the element-wise power operator (.^) instead of a loop. Store the result into 'ss2'

ss2 = sum(v.^2);

% Make another for loop that goes through the elements of v, and creates a same size vector called 'w' containing -1 for odd, and +1 even valued element indexes of v.
% Use the if-else construct to choose which one (-1 or +1) to pick for each element

w = [];

for value=1:length(v);
    
    check_index = (-1)^v(value);
    if check_index == -1;
        w(end+1) = -1;
    
    else
        w(end+1) = 1;
    end
end

w = transpose(w);

% Similarly to previous but instead of a for loop, create the vector 'w2' by artihmetically manipulating the output of the modulo function ('mod') on the whole vector v


w2_mod = mod(v,2);
w2 = [];

for modulo=1:length(w2_mod);
 
    if w2_mod(modulo) == 1;
        w2(end+1) = -1;
    
    else
        w2(end+1) = 1;
    end
end

w2 = transpose(w2);

% Find the maximum value of the elements of v and store it into variable 'v_max'

v_max = max(v);

% Find the index (not the value) of the minimum valued element of v into variable 'v_min_loc'. In case of multiple minima, store only the location of the first one.

v_min = min(v);

for val=1:length(v)
    if v(val) == v_min;
       v_min_loc=val;
       break
    end
end
