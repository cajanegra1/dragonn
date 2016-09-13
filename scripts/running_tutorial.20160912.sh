## Installation (see Evernote "DRAGONN Tutorial")
http://kundajelab.github.io/dragonn/cloud_resources.html
Creating Amazon instance:
Spot instance: $5
Tag: Name DragonnAlv
The following Spot Instance requests have been created: sir-03zrrwhk
Instance i-850dee31
=> named DragonnAlv
ssh -i ~/Epinomics/alvaroMBPkeypair.pem ubuntu@ec2-54-67-95-49.us-west-1.compute.amazonaws.com
sudo su
passwd
CopiaMaquinaAnshul4
passwd ubuntu
CopiaMaquinaAnshul4
./launch_notebook.sh
Instance Public IP: 54.67.95.49
54.67.95.49:80
ubuntu
CopiaMaquinaAnshul4

Anu gave me access to her server:
ssh -i ~/Epinomics/alvaroAWS02SEP2015.pem ubuntu@54.218.69.24
=> if working ok, will stop my machine.

Following Anu’s suggestion (and Anshul’s tutorial):
git clone https://github.com/kundajelab/dragonn.git
cd dragonn
sudo /usr/local/anaconda2/bin/python setup.py install
screen -S tutorial

## 15 seconds to your first DragoNN model
# The `dragonn` package provides a simple command line interface to train DragoNN models, test them, and predict on sequence data. Train an example model by running:

dragonn train --pos-sequences examples/example_pos_sequences.fa --neg-sequences examples/example_neg_sequences.fa --prefix training_example
# ...
# Epoch 15: validation loss: 0.585
# Balanced Accuracy: 69.55%        auROC: 0.777    auPRC: 0.800    auPRG: 0.557
# Recall at 5%|10%|20% FDR: 12.2%|28.1%|60.1%      Num Positives: 524      Num Negatives: 476
#
# Epoch 16: validation loss: 0.582
# Balanced Accuracy: 70.30%        auROC: 0.779    auPRC: 0.802    auPRG: 0.561
# Recall at 5%|10%|20% FDR: 10.5%|29.8%|60.7%      Num Positives: 524      Num Negatives: 476
#
# Epoch 17: validation loss: 0.617
# Balanced Accuracy: 68.83%        auROC: 0.778    auPRC: 0.800    auPRG: 0.556
# Recall at 5%|10%|20% FDR: 0.0%|34.5%|58.8%       Num Positives: 524      Num Negatives: 476
#
# Epoch 18: validation loss: 0.615
# Balanced Accuracy: 72.18%        auROC: 0.784    auPRC: 0.807    auPRG: 0.567
# Recall at 5%|10%|20% FDR: 12.0%|36.6%|60.7%      Num Positives: 524      Num Negatives: 476
#
# Epoch 19: validation loss: 0.628
# Balanced Accuracy: 72.37%        auROC: 0.783    auPRC: 0.806    auPRG: 0.566
# Recall at 5%|10%|20% FDR: 12.8%|34.2%|61.3%      Num Positives: 524      Num Negatives: 476
#
# Epoch 20: validation loss: 0.596
# Balanced Accuracy: 70.72%        auROC: 0.784    auPRC: 0.807    auPRG: 0.566
# Recall at 5%|10%|20% FDR: 11.6%|37.6%|59.2%      Num Positives: 524      Num Negatives: 476
#
# Epoch 21: validation loss: 0.621
# Balanced Accuracy: 71.91%        auROC: 0.787    auPRC: 0.810    auPRG: 0.571
# Recall at 5%|10%|20% FDR: 12.6%|38.4%|60.5%      Num Positives: 524      Num Negatives: 476
#
# Epoch 22: validation loss: 0.604
# Balanced Accuracy: 70.73%        auROC: 0.788    auPRC: 0.811    auPRG: 0.568
# Recall at 5%|10%|20% FDR: 24.2%|41.8%|58.4%      Num Positives: 524      Num Negatives: 476
#
# final validation metrics:
# Balanced Accuracy: 70.73%        auROC: 0.788    auPRC: 0.811    auPRG: 0.568
# Recall at 5%|10%|20% FDR: 24.2%|41.8%|58.4%      Num Positives: 524      Num Negatives: 476
# saving model files..
# Done!

# This will store a model file, training_example.model.json, with the model architecture and a weights file, training_example.weights.hd5, with the parameters of the trained model. Test the model by running:

dragonn test --pos-sequences examples/example_pos_sequences.fa --neg-sequences examples/example_neg_sequences.fa --model-file training_example.model.json --weights-file training_example.weights.hd5
# Using Theano backend.
# Using gpu device 0: GRID K520 (CNMeM is disabled, CuDNN not available)
# /usr/local/anaconda2/lib/python2.7/site-packages/theano/tensor/signal/downsample.py:6: UserWarning: downsample module has been moved to the theano.tensor.signal.pool module.
#   "downsample module has been moved to the theano.tensor.signal.pool module.")
# loading sequence data...
# loading model...
# testing model...
# Balanced Accuracy: 90.28%        auROC: 0.955    auPRC: 0.956    auPRG: 0.935
# Recall at 5%|10%|20% FDR: 80.3%|90.8%|95.1%      Num Positives: 2500     Num Negatives: 2500

# This will print the model's test performance metrics. Model predictions on sequence data can be obtained by running:

dragonn predict --sequences examples/example_pos_sequences.fa --model-file training_example.model.json --weights-file training_example.weights.hd5 --output-file example_predictions.txt
# Using Theano backend.
# Using gpu device 0: GRID K520 (CNMeM is disabled, CuDNN not available)
# /usr/local/anaconda2/lib/python2.7/site-packages/theano/tensor/signal/downsample.py:6: UserWarning: downsample module has been moved to the theano.tensor.signal.pool module.
#   "downsample module has been moved to the theano.tensor.signal.pool module.")
# loading sequence data...
# loading model...
# getting predictions...
# saving predictions to output file...
# Done!

# This will store the model predictions for sequences in example_pos_sequences.fa in the output file example_predictions.txt. Interpret sequence data with a dragonn model by running:

dragonn interpret --sequences examples/example_pos_sequences.fa --model-file training_example.model.json --weights-file training_example.weights.hd5 --prefix example_interpretation
# Using Theano backend.
# Using gpu device 0: GRID K520 (CNMeM is disabled, CuDNN not available)
# /usr/local/anaconda2/lib/python2.7/site-packages/theano/tensor/signal/downsample.py:6: UserWarning: downsample module has been moved to the theano.tensor.signal.pool module.
#   "downsample module has been moved to the theano.tensor.signal.pool module.")
# loading sequence data...
# loading model...
# getting predictions...
# getting deeplift scores...
# extracting important sequences and writing to file...
# Done!

# This will write the most important subsequence in each input sequence along with its location in the input sequence in the file example_interpretation.task_0.important_sequences.txt.
# Note: by default, only examples with predicted positive class probability >0.5 are interpreted. Examples below this thershold yield important subsequence of Ns with location -1. This default can be changed with the flag --pos-thershold.
