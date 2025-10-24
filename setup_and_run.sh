#!/bin/bash

git clone https://github.com/joshkokatnur/csc-491-issue-classifier.git
cd csc-491-issue-classifier/
wget -c https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh -b -p ~/miniconda3
export PATH="$HOME/miniconda3/bin:$PATH"
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bashrc
~/miniconda3/bin/conda init bash
source ~/.bashrc
~/miniconda3/bin/conda env create -f environment.yaml
cd data
chmod +x get_data.sh
./get_data.sh
cd ..
source ~/miniconda3/etc/profile.d/conda.sh
conda activate issue-classifier
python src/data_split.py
python src/train.py --DATASET_SUFFIX _dropfeature --MODEL_NAME roberta --EMB_MODEL_CHECKPOINT roberta-base --device gpu
