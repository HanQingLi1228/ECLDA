import numpy as np
import matplotlib
import matplotlib as mpl
import matplotlib.pyplot as plt

font = {'family' : 'normal',
        # 'weight' : 'bold',
        'size'   : 10}


matplotlib.rc('font', **font)


result_file_path = 'eval_results.txt'
result_list = []

file = open(result_file_path,mode='r')
result_file = file.readlines()

def get_line_index(lookup):
    for idx, line in enumerate(result_file):
        if lookup in line:
            return idx
    return -1

augmentations = ['feature_cutoff', 'token_cutoff', 'span', 'dropout']
rate_range = {'feature_cutoff': ['05', '10', '15', '20', '25', '30', '35', '40','45','50','55','60'],\
              'token_cutoff':['05', '10', '15', '20', '25', '30', '35', '40'], \
              'span':['05', '10', '15', '20', '25'], \
              'dropout':['05', '10', '15', '20', '25', '30', '35', '40','45','50','55','60']}

int_list = lambda l: [int(item) for item in l]

rate_range_int = {k: int_list(v) for k, v in rate_range.items()}

da_2 = 'shuffle'
rate_name_2='0'
cutoff_rate_2=int(rate_name_2)/100
da_1 = 'feature_cutoff'
result_dict = {}

for da_1 in augmentations:
    result_dict[da_1] = []
    for rate_name_1 in rate_range[da_1]:
        # assign cutoff_rate
        cutoff_rate_1=int(rate_name_1)/100
        model_save_path=f'output_auto/unsup-consert-base-{da_1}-{rate_name_1}-{da_2}-{rate_name_2}\n'

        line_index = get_line_index(model_save_path)

        if line_index==-1:
            print(f"Warning! Can't find {model_save_path}")
        else:
            eval = float(result_file[line_index+2].strip().split(' ')[1]) * 100
            # a = f.readlines()[line_index+4]
            eval_last2 = float(result_file[line_index+4].strip().split(' ')[1]) * 100
            # print(model_save_path.strip())
            # print(max(eval, eval_last2))
            result_dict[da_1].append(max(eval, eval_last2))

best_rate = {'feature_cutoff': '45','token_cutoff':'10', 'span':'05', 'dropout':'50'}

color_list = ['red', 'green', 'blue', 'black']
plt.gca().set_prop_cycle(plt.cycler('color', ['red', 'green', 'blue', 'black']))

# plotting the line 1 points 
for i, aug in enumerate(augmentations):
    best_rate_idx = int(int(best_rate[aug])/5) - 1
    plt.plot(rate_range_int[aug], result_dict[aug], label = 'shuffle + '+aug, lw=4)
    
    x0 = int(best_rate[aug])
    y0 = result_dict[aug][best_rate_idx]
    #画点
    plt.scatter(x0,y0,s=100,c=color_list[i])
    #画虚线
    plt.plot([x0,x0],[y0,71.25],'--',lw=2,c=color_list[i])

plt.xticks(rate_range_int['dropout'])

plt.xlabel('Dropout Rate (%)',fontsize=16,fontweight='bold')
# Set the y axis label of the current axis.
plt.ylabel('Average Accuracy (%)',fontsize=16,fontweight='bold')
# Set a title of the current axes.
# plt.title('Best Dropout Rate Selection')
# show a legend on the plot
plt.legend(loc='upper left',prop={'size': 14})

ax = plt.gca()                                           

ax.spines['right'].set_color('none') 
ax.spines['top'].set_color('none')      

ax.xaxis.set_ticks_position('bottom')   
ax.yaxis.set_ticks_position('left')     

ax.spines['bottom'].set_position(('data', 71.25))   
ax.spines['left'].set_position(('data', 0))

plt.xlim([0, 65])

# Display a figure.
plt.show()



file.close()