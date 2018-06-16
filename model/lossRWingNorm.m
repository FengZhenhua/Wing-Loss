classdef lossRWingNorm < dagnn.Loss
    properties
        width = 10
        curvity = 2
        rcwidth = 0.2
        
%         x = -20:0.001:20;
%         y = abs(x);
%         nolinearRegion = y < width;
%         reRegion = y < rcwidth;
%         y(nolinearRegion) = width * log( 1 + (y(nolinearRegion) - rcwidth) / curvity);
%         y(~nolinearRegion) = y(~nolinearRegion) + log((curvity+width-rcwidth)/curvity/exp(1)) * width;
%         y(reRegion) = 0;
%         plot(x,y);
%         hold on
%         
%         rcwidth = 1
%         x = -20:0.001:20;
%         y = abs(x);
%         nolinearRegion = y < width;
%         reRegion = y < rcwidth;
%         y(nolinearRegion) = width * log( 1 + (y(nolinearRegion) - rcwidth) / curvity);
%         y(~nolinearRegion) = y(~nolinearRegion) + log((curvity+width-rcwidth)/curvity/exp(1)) * width;
%         y(reRegion) = 0;
%         plot(x,y);
%         
%         grid on
    end
    
    methods
        function outputs = forward(obj, inputs, ~)
            y = abs(inputs{1} - inputs{2});
            y = y(:);
            
            nolinearRegion = y < obj.width;
            reRegion = y < obj.rcwidth;
            y(nolinearRegion) = obj.width * log( 1 + (y(nolinearRegion) - obj.rcwidth) / obj.curvity);
            y(~nolinearRegion) = y(~nolinearRegion) + log( (obj.curvity + obj.width - obj.rcwidth) / obj.curvity / exp(1)) * obj.width;
            y(reRegion) = 0;
            %             y(~reRegion) = y(~reRegion) - obj.width * log( (obj.curvity + obj.rcwidth) / obj.curvity);
            
            outputs{1} = sum(y) / size(inputs{1}, 3);
            
            n = obj.numAveraged;
            m = n + size(inputs{1},4);
            obj.average = (n * obj.average + gather(outputs{1})) / m;
            obj.numAveraged = m;
        end
        
        function [derInputs, derParams] = backward(obj, inputs, ~, derOutputs)
            delta = inputs{1} - inputs{2};
            
            absDelta = abs(delta);
            nolinearRegion = absDelta < obj.width;
            reRegion = absDelta < obj.rcwidth;
            
            dx = sign(delta);
            dx(nolinearRegion) = obj.width ./ (absDelta(nolinearRegion) + obj.curvity - obj.rcwidth) .* dx(nolinearRegion);
            dx(reRegion) = 0;
            
            dx = derOutputs{1} * dx / size(inputs{1}, 3);
            
            derInputs{1} = dx;
            derInputs{2} = [];
            derParams = {};
            
        end
        
        function obj = lossRWingNorm(varargin)
            obj.load(varargin);
            obj.loss = 'lossRWingNorm';
        end
    end
end
