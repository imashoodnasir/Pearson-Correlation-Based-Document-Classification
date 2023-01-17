<h1>Pearson Correlation Based Document Classification</h1>

<p>Documents are stored in digital form across several organizations. Printing this amount of data and placing it into folders instead of storing digitally is against the practical, economical and ecological point of view. An efficient way of retrieving data from digitally stored documents is also required. This article presents a real-time supervised learning technique for document classification based on Deep Convolutional Neural Network, which is aimed at reducing the impact of adverse document image issues such as signatures, marks, logo and handwritten notes. The major steps of the proposed technique include data augmentation, feature extraction using pre-trained neural network models, feature fusion and feature selection.</p>
<p>We propose a novel data augmentation technique, which normalizes the imbalanced dataset using the secondary dataset, named RVL-CDIP. The DCNN features are extracted using the VGG19 and AlexNet networks. The extracted features are fused, and the fused feature vector is optimized by applying a Pearson Correlation Coefficient based technique to select the optimized features, while removing the redundant features. The proposed technique is tested on the Tobacco-3482 dataset, which gives a classification accuracy of 93.1% using a cubic Support Vector Machine classifier, which proves the validity of the proposed technique.</p>

<h3>Detailed model of the proposed method</h3>
<img src="https://user-images.githubusercontent.com/122672521/212987997-66a25b19-16cc-469f-9fee-b3e8b5fdb54c.png" alt="Detailed model of the proposed method">

<h3>Flow Diagram of Data Augmenter</h3>
<img src="https://user-images.githubusercontent.com/122672521/212987981-0a5573c9-b86c-4f10-b1a6-f383d3e9851e.jpg" alt="Flow Diagram of Data Augmenter">

<h3>Impact of Data Augmentation</h3>
<img src="https://user-images.githubusercontent.com/122672521/212987984-9718f06d-e340-4cb4-b855-2c2e4ae6d2ea.PNG" alt="Impact of Data Augmentation">

<h3>Sample images from Tobacco 3482</h3>
<img src="https://user-images.githubusercontent.com/122672521/212987995-2ddebb17-f595-4c0b-86c7-af5e2f48811b.jpg" alt="Sample images from Tobacco 3482">

<h3>Labelled outputs of the proposed technique</h3>
<img src="https://user-images.githubusercontent.com/122672521/212987988-48cffff0-bba7-495b-a3a7-43278b4a7151.jpg" alt="Labelled outputs of the proposed technique">

<h3>Confusion matrices for the Tobacco-3482 dataset</h3>
<img src="https://user-images.githubusercontent.com/122672521/212987965-0f54f157-068e-4c75-af91-3a8423d6ce0a.jpg" alt="Confusion matrices for the Tobacco-3482 dataset">

<h3>Citation</h3>
<h3>Nasir, Inzamam Mashood, et al. "Pearson correlation-based feature selection for document classification using balanced training." Sensors 20.23 (2020): 6793.</h3>
