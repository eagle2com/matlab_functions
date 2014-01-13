function ubergraph
global g_axis
set(gca,'Color',[0 0 0])
set(gca,'Xcolor',[0.5 0.5 0.5]);
set(gca,'Ycolor',[0.5 0.5 0.5]);
set(gcf,'Color',[0 0 0]);
grid
xlabel('Hue')
set(gcf,'KeyPressFcn',@key_press)
g_axis = gca;
end

function key_press(obj,event)
global g_axis
    l_xlim = get(gca,'Xlim');
    l_ylim = get(gca,'Ylim');
    key = get(gcf,'CurrentKey');
    if strcmp(key,'uparrow')
        l_ylim = l_ylim + (l_ylim(2)-l_ylim(1))/20.0;
    end
    if strcmp(key,'downarrow')
        l_ylim = l_ylim - (l_ylim(2)-l_ylim(1))/20.0;
    end
    if strcmp(key,'leftarrow')
        l_xlim = l_xlim - (l_xlim(2)-l_xlim(1))/20.0;
    end
    if strcmp(key,'rightarrow')
        l_xlim = l_xlim + (l_xlim(2)-l_xlim(1))/20.0;
    end
    if strcmp(key,'subtract')
        xmid = (l_xlim(2)+l_xlim(1))/2;
        xabs = l_xlim(2)-l_xlim(1);
        l_xlim(1) = xmid-xabs/2*1.1;
        l_xlim(2) = xmid+xabs/2*1.1;
        
        ymid = (l_ylim(2)+l_ylim(1))/2;
        yabs = l_ylim(2)-l_ylim(1);
        l_ylim(1) = ymid-yabs/2*1.1;
        l_ylim(2) = ymid+yabs/2*1.1;
    end
    if strcmp(key,'add')
        xmid = (l_xlim(2)+l_xlim(1))/2;
        xabs = l_xlim(2)-l_xlim(1);
        l_xlim(1) = xmid-xabs/2/1.1;
        l_xlim(2) = xmid+xabs/2/1.1;
        
        ymid = (l_ylim(2)+l_ylim(1))/2;
        yabs = l_ylim(2)-l_ylim(1);
        l_ylim(1) = ymid-yabs/2/1.1;
        l_ylim(2) = ymid+yabs/2/1.1;
    end
    set(gca,'Xlim',l_xlim)
    set(gca,'Ylim',l_ylim)
end