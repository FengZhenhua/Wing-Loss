classdef lgLoss < dagnn.Loss
    properties
        width = 10
        curvity = 1

%         x = -20:0.001:20;
%         y = abs(x);
%         nolinearRegion = y < width;
%         y(nolinearRegion) = width * log( (curvity+y(nolinearRegion)) / curvity);
%         y(~nolinearRegion) = y(~nolinearRegion) + log((curvity+width)/curvity/exp(1)) * width;
%         plot(x,y);
%         grid on
    end
    
    methods
        function outputs = forward(obj, inputs, ~)
            delta = inputs{1} - inputs{2};
            
            y = abs(delta);
            y = y(:);
            
            nolinearRegion = y < obj.width;
            y(nolinearRegion) = obj.width * log( (obj.curvity + y(nolinearRegion)) / obj.curvity);
            y(~nolinearRegion) = y(~nolinearRegion) + log( (obj.curvity + obj.width) / obj.curvity / exp(1)) * obj.width;
                        
            outputs{1} = sum(y);
            
            n = obj.numAveraged;
            m = n + size(inputs{1},4);
            obj.average = (n * obj.average + gather(outputs{1})) / m;
            obj.numAveraged = m;
        end
        
        function [derInputs, derParams] = backward(obj, inputs, ~, derOutputs)
            delta = inputs{1} - inputs{2};
            
            absDelta = abs(delta);
            nolinearRegion = absDelta < obj.width;
            
            dx = sign(delta);
            dx(nolinearRegion) = obj.width ./ (absDelta(nolinearRegion) + obj.curvity) .* dx(nolinearRegion);
            
            dx = derOutputs{1} * dx;
            
            derInputs{1} = dx;
            derInputs{2} = [];
            derParams = {};
            
        end
        
        function obj = lgLoss(varargin)
            obj.load(varargin);
            obj.loss = 'lgLoss';
        end
    end
end
