function distances = mahalanobis(data, covarianceMatrix, meanVector)
    % Ensure that data and meanVector have compatible data types
    if ~isa(data, 'double')
        data = double(data);
    end
    if ~isa(meanVector, 'double')
        meanVector = double(meanVector);
    end
    
    % Calculate the Mahalanobis distances for each data point
    centeredData = data - meanVector;
    invCovariance = inv(covarianceMatrix);
    distances = sqrt(sum((centeredData * invCovariance) .* centeredData, 2));
end
