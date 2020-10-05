![ThingiPano](/README_images/GEARS.png)
## ThingiPano: A Large-Scale Dataset of 3D Printing Metadata, Images, and Panoramic Renderings for Exploring Design Reuse

Contains JSON-Formatted Publicly-Available Metadata from [Thingiverse](https://thingiverse.com) (up to 2018), for both Users (n=283,873) and Designs (n=1,017,687). For qualitative analysis and for machine-learning applications, images associated with designs and multi-view panoramic 3D depth-map renders of 3D files are available for each design. For validation purposes, these panoramic renders are also provided for Shapenet, along with Matlab source code for generating these renders. Files are available for download at [archive.org](https://archive.org/details/ThingiPano)

|Files|Compressed Size|Uncompressed Size|Number of Entries|
|-----|---------------|-----------------|-----------------|
|[Thingiverse Images](https://archive.org/download/ThingiPano/Thingiverse_Images.zip)|97.5 GB|100 GB|1,816,295 images|
|[Rendered Panoramas](https://archive.org/download/ThingiPano/ThingiPano_Panoramas.zip)|27.6 GB|31 GB|1,052,017 3-view panoramas|
|[Design Metadata](https://archive.org/download/ThingiPano/Thingiverse_Design_Metadata.zip)|717 MB|4 GB|1,017,687 Designs|
|[User Metadata](https://archive.org/download/ThingiPano/Thingiverse_User_Metadata.zip)|28.1 MB|209 MB|283,873 Users|
|[Shapenet Panoramas](https://archive.org/download/ThingiPano/Shapenet.zip)|1.34 GB|1.8GB|44,902 3-view panoramas|

## Examples
Below are some examples of design images and an associated 3-view panoramic depth-map representation of design 3D files. As discussed in the paper, this can be utilized for large scale analysis and tools to support reuse of 3D files for 3D Design and 3D Printing. 

Keys outlining the contents of [User Metadata](https://github.com/Alexander-Berman/ThingiPano/blob/master/data/metadata_user_key.txt) and [Design Metadata](https://github.com/Alexander-Berman/ThingiPano/blob/master/data/metadata_design_key.txt) are available in the [data directory](https://github.com/Alexander-Berman/ThingiPano/tree/master/data), along with a [Jupyter Notebook demonstrating how to quickly load the needed Metadata](https://github.com/Alexander-Berman/ThingiPano/blob/master/data/example_notebook.ipynb). 

For machine learning purposes, an example data generator for loading the panoramas into a Keras neural network is provided in [another example notebook](https://github.com/Alexander-Berman/ThingiPano/blob/master/Keras_Example.ipynb).

![ThingiPano](/README_images/Examples.png)

## Attribution
Won the Best Student Paper award at the [Sixth IEEE Conference on Multimedia Big Data (2020)](http://bigmm2020.org/). Please cite the following if you utilize this dataset:
> Berman, Alexander, &amp; Quek, Francis (2020). ThingiPano: A Large-Scale Dataset of 3D Printing Metadata, Images, and Panoramic Renderings for Exploring Design Reuse. New Delhi: The Sixth IEEE International Conference on Multimedia Big Data.

[![IEEEBigMM](/README_images/IEEEBigMM.png)](http://bigmm2020.org/)
