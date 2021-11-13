function r = fnc_drawClickableRectangle(ax)

arguments
    ax matlab.ui.control.UIAxes
end

r = drawrectangle(ax, 'AspectRatio', 1);
addlistener(r, ROIClicked=@(src, evt) clickCallback(src, evt, ax));

end

function clickCallback(src, evt, ax)

arguments
    src images.roi.Rectangle
    evt images.roi.ROIClickedEventData
    ax matlab.ui.control.UIAxes
end

if strcmp(evt.SelectionType, "right")
    return;
end

ind = find(arrayfun(@(child) strcmp(child.Tag, "target"), ax.Children), 1);
Img = ax.Children(ind).CData;

pos = round(src.Position);
x = max(pos(1), 1);
y = max(pos(2), 1);
w = pos(3);
h = pos(4);
Img = Img(y:y+h, x:x+w);

[featureVector, hogVisualization] = extractHOGFeatures(Img, CellSize=[4, 4]);

figure;
imshow(Img);
hold on;
plot(hogVisualization);

end