classdef UIWind < matlab.ui.componentcontainer.ComponentContainer
    properties
        Speed {mustBeGreaterThanOrEqual(Speed,0)} = 0;
        Direction {mustBeGreaterThanOrEqual(Direction, 0), ...
            mustBeLessThanOrEqual(Direction, 360)} = 0;
    end
    
    properties (Access = protected,Transient,NonCopyable)
        HTML matlab.ui.control.HTML;
    end
    
    methods (Access = protected)
        function setup(this)
            g = uigridlayout(this,[1,1],...
                'Padding',0);
            this.HTML = uihtml(g,'HTMLSource', ...
                fileread(fullfile(fileparts(mfilename('fullpath')), ...
                'WindWidget.html')));   
            this.BackgroundColor = 'w';
        end
        
        function update(this)
            this.HTML.Data = struct('Speed',this.Speed,...
                'Direction',this.Direction);
        end
    end        
end