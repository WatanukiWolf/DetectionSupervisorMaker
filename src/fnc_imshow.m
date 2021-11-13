function fnc_imshow(ax, Img)
arguments
    ax matlab.ui.control.UIAxes
    Img (:, :, :) {mustBeNumeric}
end

imagesc(ax, Img, Tag="target");
axis(ax, "equal");
axis(ax, "tight");
axis(ax, "ij");
end