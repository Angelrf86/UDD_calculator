function tsunamisData
%t = readtable('tsunamis.xlsx');
t = rand(4,20);

uf = uifigure;
uf.Position(3:4) = [822 360];

uit = uitable(uf);
uit.Data = t;
uit.ColumnSortable = [false true true true];
uit.ColumnEditable = true;
uit.Position(3) = 375;
uit.DisplayDataChangedFcn = @updatePlot;

ax = uiaxes(uf);
ax.Position(1) = 415;
ax.YLabel.String = 'Max Height';
x(1,:) = t(1,:);
y(1,:) = t(2,:);
area(ax,x,y)

    function updatePlot(src,event)
        t = uit.DisplayData;
        area(ax,x,y)
    end



h = uit.Data;

end
