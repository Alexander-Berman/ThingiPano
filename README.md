![ThingiPano](/README_images/GEARS.png)
## ThingiPano: A Large-Scale Dataset of 3D Printing Metadata, Images, and Panoramic Renderings for Exploring Design Reuse

Contains JSON-Formatted Publicly-Available Metadata from Thingiverse (up to 2018), for both Users (n=283,873) and Designs (n=1,017,687). For qualatative analysis and for machine-learning applications, images associated with designs and multi-view panoramic 3D depth-map renders of 3D files are available for each design. 

The Metadata is available [here]((https://github.com/Alexander-Berman/ThingiPano/tree/master/data)), the code for generating panormas is available [here](https://github.com/Alexander-Berman/ThingiPano/tree/master/panorama_generation_code) (derived from [DeepPano](https://github.com/bgshih/deeppano)), and you can download the 1,816,295 images and 1,052,017 representations of 3D files here. For validaiton with verified 3D Datasets, the panorama representations for [Shapenet](https://www.shapenet.org/) are available here.

## Examples
Below are some examples of design images and an associated 3-view panoramic depth-map representation of design 3D files. As discussed in the paper, this can be utilized for large scale analysis and tools to support reuse of 3D files for 3D Design and 3D Printing. 

Keys outlining the contents of [User Metadata](https://github.com/Alexander-Berman/ThingiPano/blob/master/data/metadata_user_key.txt) and [Design Metadata](https://github.com/Alexander-Berman/ThingiPano/blob/master/data/metadata_design_key.txt) are available in the [data directory](https://github.com/Alexander-Berman/ThingiPano/tree/master/data), along with a [Jupyter Notebook demonstrating how to quickly load the needed Metadata](https://github.com/Alexander-Berman/ThingiPano/blob/master/data/example_notebook.ipynb).

![ThingiPano](/README_images/Examples.png)

## Attribution
To appear at the [Sixth IEEE Conference on Multimedia Big Data (2020)](http://bigmm2020.org/). Please cite the following if you utilize this dataset:
> Berman, Alexander, &amp; Quek, Francis (2020). ThingiPano: A Large-Scale Dataset of 3D Printing Metadata, Images, and Panoramic Renderings for Exploring Design Reuse. New Delhi: The Sixth IEEE International Conference on Multimedia Big Data.

[![IEEEBigMM](/README_images/IEEEBigMM.png)](http://bigmm2020.org/)
