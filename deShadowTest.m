% Step 1: Create a MATLAB script (e.g., test_remove_shadows.m)

% Step 2: Load an image
inputImage = imread('sharpened_image.jpg'); % Replace 'your_image.jpg' with your image file path

% Step 3: Define the Gaussian filter's sigma (adjust as needed)
sigma = 0.23;

% Step 4: Call the removeShadows function
filteredImage = deShadow(inputImage, sigma);

% Step 5: Display the original and filtered images
subplot(1, 2, 1), imshow(inputImage), title('Original Image');
subplot(1, 2, 2), imshow(filteredImage), title('Filtered Image');

% Optional: Save the filtered image
imwrite(filteredImage, 'shadow_removed_image.jpg'); % Change the filename as needed
