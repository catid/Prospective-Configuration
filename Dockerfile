# build
# docker build -t dryuhangsong/prospective-configuration:latest .
# push
# docker push dryuhangsong/prospective-configuration:latest

FROM rayproject/ray-ml:2.4.0-py38-gpu

# RUN rm -rf /home/ray/anaconda3/lib/python3.7/site-packages/numpy

# others
RUN pip install seaborn tqdm visdom plotly tabulate

# RUN pip install --upgrade tensorflow-probability

ENV DATA_DIR=/home/ray/data/
RUN mkdir $DATA_DIR
RUN python -c "from torchvision import datasets; import os; [eval(f'datasets.{dataset}')(os.environ.get('DATA_DIR'),download=True) for dataset in ['FashionMNIST']]"
RUN python -c "from torchvision import datasets; import os; [eval(f'datasets.{dataset}')(os.environ.get('DATA_DIR'),download=True) for dataset in ['CIFAR10']]"