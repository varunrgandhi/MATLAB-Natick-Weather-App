classdef WeatherChart < matlab.graphics.chartcontainer.ChartContainer
%WeatherChart Displays plots from the ThingSpeak weather station
%  
% weather = thingSpeakRead(12397,'DateRange',[(datetime("today") - days(2)) datetime],'OutputFormat','table')
%     w = WeatherChart('Data',weather);
%

  properties
     Data table = SampleData
     Variables = {'WindSpeedmph','Humidity','TemperatureF'}
  end
  properties( UsedInUpdate=false )
      Plot matlab.graphics.chart.StackedLineChart
  end
      
   methods( Access=protected)
       
       function setup(~)
       end
       
       function update(obj)
           tl = getLayout(obj);         
           obj.Plot = stackedplot(tl, obj.Data, 'DisplayVariables', obj.Variables);
           obj.Plot.XVariable = 'Timestamps';
           obj.Plot.GridVisible = 'on';
           obj.Plot.LineProperties(2).Color = 'red';
           obj.Plot.LineProperties(3).Color = 'green';
           obj.Plot.LineWidth = 2;
       end         
   end    
end

function s = SampleData()
    a = rand(200,3);
    b = 1:200;
    a = [b.' a];   
    s = array2table(a, 'VariableNames',{'Timestamps','WindSpeedmph','Humidity','TemperatureF'});
end