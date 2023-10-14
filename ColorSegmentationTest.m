classdef ColorSegmentationTest < matlab.unittest.TestCase
    methods (Test)
        function testEuclideanSegmentation(testCase)
            % Create a sample RGB image (replace with your own image)
            rgbImage = imread('Goes_East.jpg');

            % Define the expected output image based on your test case
            % Replace this with your own expected output
            expectedOutput = zeros(size(rgbImage, 1), size(rgbImage, 2));

            % Define segmentation parameters
            T = 0.1;  % Adjust the threshold as needed
            m = [0.5, 0.5, 0.5];  % Adjust the mean vector as needed

            % Call the colorseg function
            outputImage = colorseg(rgbImage, T, m);

            % Perform assertions to check if the output matches the expected result
            testCase.verifyEqual(outputImage, expectedOutput);
        end

        function testMahalanobisSegmentation(testCase)
            % Create a sample RGB image (replace with your own image)
            rgbImage = imread('Goes_East.jpg');

            % Define the expected output image based on your test case
            % Replace this with your own expected output
            expectedOutput = zeros(size(rgbImage, 1), size(rgbImage, 2));

            % Define segmentation parameters
            T = 0.1;  % Adjust the threshold as needed
            m = [0.5, 0.5, 0.5];  % Adjust the mean vector as needed
            C = eye(3);  % Identity covariance matrix for simplicity, adjust as needed

            % Call the colorseg function with the 'mahalanobis' method
            outputImage = colorseg(rgbImage, T, m, C);

            % Perform assertions to check if the output matches the expected result
            testCase.verifyEqual(outputImage, expectedOutput);
        end
    end
end
