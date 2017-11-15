%In this directory, you will find some example data, which is a 300x8
%array stored in a .mat file. Image these are measurements for 300 genes are 8 different time
%points
% GB comments
1)100
2)100 becareful. Gave you credit, but the second dimension is still an order of magnitude higher than the others. 
3)100
4)100
overall: 100

%1. Use matlab to perform pca on this data, getting the transformation
%matrix, the transformed data, and the eigenvalues.
%XiaotongLu:
[coeff,sc,eig]=pca(dat)
%2. Look at the eigenvalues - how many dimensions are necessary to explain
%the data?
%XiaotongLu:
1 dimension is necessary to explain the data.

%3. Using kmeans clustering to cluster the data into 3 clusters. 
% Make a plot of the first coordinate of the raw data vs the second color coded
% by which cluster it is in. Make the same plot but use the first two
% principle components instead. 
%XiaotongLu:
ids=kmeans(dat,3);
x=1:8;
for ii=1:3
    inds=ids==ii;
    %subplot(1,3,ii);
    plot(x,mean(dat(inds,:),1),'.-','LineWidth',3,'MarkerSize',18);
    hold on,
    title(['Cluster' int2str(ii), 'ngenes:' int2str(sum(inds))]);
end
%XiaotongLu:
[coeff,sc,eig]=pca(dat);
color={'r','y','g','b','c','n','k','m'};
figure;
hold on;
plot(sc(:,1),sc(:,2),'r.-','LineStyle','none','MarkerSize',24);
plot(sc(end,1),sc(end,2),'k.','MarkerSize',24);

%4. Repeat part 3 but use 7 clusters. Which is a more appropriate number of
%clusters for the data?
%XiaotongLu:
ids=kmeans(dat,7);
x=1:8;
for ii=1:7
    inds=ids==ii;
    %subplot(3,4,ii);
    plot(x,mean(dat(inds,:),1),'.-','LineWidth',3,'MarkerSize',18);
    hold on,
    title(['Cluster' int2str(ii), 'ngenes:' int2str(sum(inds))]);
end
%XiaotongLu:
[coeff,sc,eig]=pca(dat);
color={'r','y','g','b','c','n','k','m'};
figure;
hold on;
plot(sc(:,1),sc(:,2),sc(:,3),sc(:,4),sc(:,5),sc(:,6),'r.-','LineStyle','none','MarkerSize',24);
plot(sc(end,1),sc(end,2),sc(end,3),sc(end,4),sc(end,5),sc(end,6),'k.','MarkerSize',24);
%XiaotongLu:
Comment: There is no remarkable difference between 3 cluster plot and 7 cluster plot which means 3 cluster is enough to 
seperate these data and show the main characterics of them.
