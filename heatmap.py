import numpy as np
import matplotlib
import matplotlib as mpl
import matplotlib.pyplot as plt

import pandas as pd
import seaborn as sns


augmentations = ['none','shuffle','token_cutoff','feature_cutoff','dropout','span']
result_file_path = 'eval_results.txt'
result_list = []

file = open(result_file_path,mode='r')
result_file = file.readlines()

def get_line_index(lookup):
    for idx, line in enumerate(result_file):
        if lookup in line:
            return idx
    return -1

for i, da_1 in enumerate(augmentations):
    result_list.append([])
    for da_2 in augmentations:
        # assign rate_name_1
        if da_1 == "token_cutoff":
            rate_name_1='10'
        elif da_1 == "feature_cutoff":
            rate_name_1='45'
        elif da_1 == "dropout":
            rate_name_1='50'
        elif da_1 == "span":
            rate_name_1='05'    
        else:
            rate_name_1='0'
        
        # assign rate_name_2
        if da_2 == "token_cutoff":
            rate_name_2='10'
        elif da_2 == "feature_cutoff":
            rate_name_2='45'
        elif da_2 == "dropout":
            rate_name_2='50'
        elif da_2 == "span":
            rate_name_2='05'
        else:
            rate_name_2='0'
        

        # assign cutoff_rate
        cutoff_rate_1=int(rate_name_1)/100
        cutoff_rate_2=int(rate_name_2)/100

        model_save_path=f'output_auto/unsup-consert-base-{da_1}-{rate_name_1}-{da_2}-{rate_name_2}\n'

        line_index = get_line_index(model_save_path)

        if line_index==-1:
            print(f"Warning! Can't find {model_save_path}")
        else:
            eval = float(result_file[line_index+2].strip().split(' ')[1])
            # a = f.readlines()[line_index+4]
            eval_last2 = float(result_file[line_index+4].strip().split(' ')[1])
            # print(model_save_path.strip())
            # print(max(eval, eval_last2))
            result_list[i].append(max(eval, eval_last2))

result_arr = np.array(result_list) * 100

# fig, ax = plt.subplots()
# im = ax.imshow(result_arr, cmap='YlOrBr', vmin=66, vmax=74)
# ax.set_xticks(np.arange(len(augmentations)), labels=augmentations)
# ax.set_yticks(np.arange(len(augmentations)), labels=augmentations)

# cbar = ax.figure.colorbar(im, ax=ax)

# for i in range(len(augmentations)):
#     for j in range(len(augmentations)):
#         text = ax.text(j, i, '%.2f' % result_arr[i, j],
#                        ha="center", va="center", color="black")

df = pd.DataFrame(result_arr, index=augmentations, columns=augmentations)
sns.heatmap(data=df,annot=True,fmt="0.2f",linewidths=0.3,cmap="RdBu_r",cbar_kws={'label': 'Average Accuracy (%)'}) 
plt.xticks(rotation=0)



plt.show()


        
file.close()