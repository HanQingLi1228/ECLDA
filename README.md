# Exploring Contrastive learning through data augmentation

### Group10: Li Hanqing, Li Yanqiao, Zhou Wenbin, Fan Chao, Li Chengxiao

Code for: [COMP7607, Group10, Report]()

The project is based on: [ConSERT: A Contrastive Framework for Self-Supervised Sentence Representation Transfer](https://aclanthology.org/2021.acl-long.393/)



## Requirements

```
torch==1.6.0
cudatoolkit==10.0.103
cudnn==7.6.5
sentence-transformers==0.3.9
transformers==3.4.0
tensorboardX==2.1
pandas==1.1.5
sentencepiece==0.1.85
matplotlib==3.4.1
apex==0.1.0
```

To install apex, run:
```
git clone https://github.com/NVIDIA/apex
cd apex
pip install -v --disable-pip-version-check --no-cache-dir ./
```
-------

## Get Started

### English STS Tasks

1. Download pre-trained language model (e.g. bert-base-uncased) to folder `./bert-base-uncased` from [HuggingFace's Library](https://huggingface.co/bert-base-uncased)
2. Download STS datasets to `./data` folder by running `cd data && bash get_transfer_data.bash`. The script is modified from [SentEval toolkit](https://github.com/facebookresearch/SentEval/blob/master/data/downstream/get_transfer_data.bash)
3. Run the scripts in the folder `./scripts` to reproduce our experiments. For example, run the following script to train unsupervised consert-base:
    ```bash
    bash scripts/unsup-consert-base.sh
    ```


### Translation-augumentation-mlp model (best performence)

```bash
bash scripts/translate-augumentation-mlp.sh
```
### Translation-augumentation model
```bash
bash scripts/translate-augumentation.sh
```
### Translation model
```bash
bash scripts/translate.sh
```
-------
## Experimental results(logs)

The logs are in `./logs`. The log of unsupervised ConSERT is in `./logs/logs_baseline.txt`, the log of the translation-augumentation model is in `./lpgs/Translate+token_dropout01+shuffle_epoch30.txt`, and the log of translation-augumentation-mlp model is in `./logs/Translate+token_dropout01+shuffle_epoch100_mlp.txt`



