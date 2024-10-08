#!/bin/sh

source code/py310/bin/activate

# Usage: dquartic train [OPTIONS]

#   Train a DDIM model on the DIAMS dataset.

# Options:
#   --epochs INTEGER       Number of epochs to train
#   --batch-size INTEGER   Batch size for training
#   --learning-rate FLOAT  Learning rate for optimizer
#   --hidden-dim INTEGER   Hidden dimension for the model
#   --num-heads INTEGER    Number of attention heads
#   --num-layers INTEGER   Number of transformer layers
#   --split                Whether to split the dataset
#   --normalize TEXT       Normalization method. (None, minmax)
#   --ms2-data-path TEXT   Path to MS2 data
#   --ms1-data-path TEXT   Path to MS1 data
#   --use-wandb            Enable Weights & Biases logging
#   --threads INTEGER      Number of threads for data loading
#   --help                 Show this message and exit.


epochs=1000
batch_size=1
learning_rate=0.000001
hidden_dim=1024
num_heads=8
num_layers=8
split=True
normalize='minmax'
ms2_data_path='bigdata/ms2_data_cat_int32.npy'
ms1_data_path='bigdata/ms1_data_int32.npy'
checkpoint_path="best_model_batch_minmax_norm.pth"
use_wandb=False
threads=4

dquartic train --epochs $epochs --batch-size $batch_size --learning-rate $learning_rate --hidden-dim $hidden_dim --num-heads $num_heads --num-layers $num_layers --normalize $normalize --ms2-data-path $ms2_data_path --ms1-data-path $ms1_data_path --threads $threads --checkpoint-path checkpoint_path --split --use-wandb