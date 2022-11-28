# Experiments for embedding augmentation

# first run
# feature_cutoff (05 10 15 20 25 30 35 40) and shuffle

# da_2=shuffle
# rate_name_2=0
# cutoff_rate_2=$(python -c "print(${rate_name_2}/100)")
# da_1=feature_cutoff
# for rate_name_1 in 05 10 15 20 25 30 35 40
# do
#     cutoff_rate_1=$(python -c "print(int('${rate_name_1}')/100)")
#     model_save_path=./output_auto/unsup-consert-base-${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     echo training target: ${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     python3 main.py --no_pair --seed 1 --use_apex_amp --apex_amp_opt_level O1 --batch_size 96 --max_seq_length 64 --evaluation_steps 200 --add_cl --cl_loss_only --cl_rate 0.15 --temperature 0.1 --learning_rate 0.0000005 --train_data stssick --num_epochs 10 --da_final_1 ${da_1} --da_final_2 ${da_2} --cutoff_rate_final_1 ${cutoff_rate_1} --cutoff_rate_final_2 ${cutoff_rate_2} --model_name_or_path ./bert-base-uncased/ --model_save_path ${model_save_path} --force_del --no_dropout --patience 10
# done

# second run
# feature_cutoff (45 50 55 60) and shuffle

# da_2=shuffle
# rate_name_2=0
# cutoff_rate_2=$(python -c "print(${rate_name_2}/100)")
# da_1=feature_cutoff
# for rate_name_1 in 45 50 55 60
# do
#     cutoff_rate_1=$(python -c "print(int('${rate_name_1}')/100)")
#     model_save_path=./output_auto/unsup-consert-base-${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     echo training target: ${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     python3 main.py --no_pair --seed 1 --use_apex_amp --apex_amp_opt_level O1 --batch_size 96 --max_seq_length 64 --evaluation_steps 200 --add_cl --cl_loss_only --cl_rate 0.15 --temperature 0.1 --learning_rate 0.0000005 --train_data stssick --num_epochs 10 --da_final_1 ${da_1} --da_final_2 ${da_2} --cutoff_rate_final_1 ${cutoff_rate_1} --cutoff_rate_final_2 ${cutoff_rate_2} --model_name_or_path ./bert-base-uncased/ --model_save_path ${model_save_path} --force_del --no_dropout --patience 10
# done

# third run
# token_cutoff (05 10 15 20 25 30 35 40) and shuffle

# da_2=shuffle
# rate_name_2=0
# cutoff_rate_2=$(python -c "print(${rate_name_2}/100)")
# da_1=token_cutoff
# for rate_name_1 in 05 10 15 20 25 30 35 40
# do
#     cutoff_rate_1=$(python -c "print(int('${rate_name_1}')/100)")
#     model_save_path=./output_auto/unsup-consert-base-${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     echo training target: ${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     python3 main.py --no_pair --seed 1 --use_apex_amp --apex_amp_opt_level O1 --batch_size 96 --max_seq_length 64 --evaluation_steps 200 --add_cl --cl_loss_only --cl_rate 0.15 --temperature 0.1 --learning_rate 0.0000005 --train_data stssick --num_epochs 10 --da_final_1 ${da_1} --da_final_2 ${da_2} --cutoff_rate_final_1 ${cutoff_rate_1} --cutoff_rate_final_2 ${cutoff_rate_2} --model_name_or_path ./bert-base-uncased/ --model_save_path ${model_save_path} --force_del --no_dropout --patience 10
# done

# fourth run
# dropout (05 10 15 20 25 30 35 40 45 50 55 60) and shuffle

# da_2=shuffle
# rate_name_2=0
# cutoff_rate_2=$(python -c "print(${rate_name_2}/100)")
# da_1=dropout
# for rate_name_1 in 05 10 15 20 25 30 35 40 45 50 55 60
# do
#     cutoff_rate_1=$(python -c "print(int('${rate_name_1}')/100)")
#     model_save_path=./output_auto/unsup-consert-base-${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     echo training target: ${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     python3 main.py --no_pair --seed 1 --use_apex_amp --apex_amp_opt_level O1 --batch_size 96 --max_seq_length 64 --evaluation_steps 200 --add_cl --cl_loss_only --cl_rate 0.15 --temperature 0.1 --learning_rate 0.0000005 --train_data stssick --num_epochs 10 --da_final_1 ${da_1} --da_final_2 ${da_2} --cutoff_rate_final_1 ${cutoff_rate_1} --cutoff_rate_final_2 ${cutoff_rate_2} --model_name_or_path ./bert-base-uncased/ --model_save_path ${model_save_path} --force_del --no_dropout --patience 10
# done

# fifth run
# !!!without --no_dropout!!! feature_cutoff (05 10 15 20 25 30 35 40 45 50 55 60) and shuffle

# da_2=shuffle
# rate_name_2=0
# cutoff_rate_2=$(python -c "print(${rate_name_2}/100)")
# da_1=feature_cutoff
# for rate_name_1 in 05 10 15 20 25 30 35 40 45 50 55 60
# do
#     cutoff_rate_1=$(python -c "print(int('${rate_name_1}')/100)")
#     model_save_path=./output_auto/unsup-consert-base-${da_1}-${rate_name_1}-${da_2}-${rate_name_2}-with_dropout
#     model_save_path=./output_auto/unsup-consert-base-${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     echo training target: ${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     python3 main.py --no_pair --seed 1 --use_apex_amp --apex_amp_opt_level O1 --batch_size 96 --max_seq_length 64 --evaluation_steps 200 --add_cl --cl_loss_only --cl_rate 0.15 --temperature 0.1 --learning_rate 0.0000005 --train_data stssick --num_epochs 10 --da_final_1 ${da_1} --da_final_2 ${da_2} --cutoff_rate_final_1 ${cutoff_rate_1} --cutoff_rate_final_2 ${cutoff_rate_2} --model_name_or_path ./bert-base-uncased/ --model_save_path ${model_save_path} --force_del --patience 10
# done

# 6th run
# span (05 10 15 20 25) and shuffle

# da_2=shuffle
# rate_name_2=0
# cutoff_rate_2=$(python -c "print(${rate_name_2}/100)")
# da_1=span
# for rate_name_1 in 05 10 15 20 25
# do
#     cutoff_rate_1=$(python -c "print(int('${rate_name_1}')/100)")
#     model_save_path=./output_auto/unsup-consert-base-${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     echo training target: ${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
#     python3 main.py --no_pair --seed 1 --use_apex_amp --apex_amp_opt_level O1 --batch_size 96 --max_seq_length 64 --evaluation_steps 200 --add_cl --cl_loss_only --cl_rate 0.15 --temperature 0.1 --learning_rate 0.0000005 --train_data stssick --num_epochs 10 --da_final_1 ${da_1} --da_final_2 ${da_2} --cutoff_rate_final_1 ${cutoff_rate_1} --cutoff_rate_final_2 ${cutoff_rate_2} --model_name_or_path ./bert-base-uncased/ --model_save_path ${model_save_path} --force_del --no_dropout --patience 10
# done


# 7th run
# final big heatmap

for da_1 in none shuffle token_cutoff feature_cutoff dropout span
do
    for da_2 in none shuffle token_cutoff feature_cutoff dropout span
    do
        # assign rate_name_1
        if [ "$da_1" = "token_cutoff" ]; then
            rate_name_1=10
        elif [ "$da_1" = "feature_cutoff" ]; then
            rate_name_1=45
        elif [ "$da_1" = "dropout" ]; then
            rate_name_1=50
        elif [ "$da_1" = "span" ]; then
            rate_name_1=05    
        else
            rate_name_1=0
        fi
        # assign rate_name_2
        if [ "$da_2" = "token_cutoff" ]; then
            rate_name_2=10
        elif [ "$da_2" = "feature_cutoff" ]; then
            rate_name_2=45
        elif [ "$da_2" = "dropout" ]; then
            rate_name_2=50
        elif [ "$da_2" = "span" ]; then
            rate_name_2=05
        else
            rate_name_2=0
        fi

        # assign cutoff_rate
        cutoff_rate_1=$(python -c "print(int('${rate_name_1}')/100)")
        cutoff_rate_2=$(python -c "print(int('${rate_name_2}')/100)")

        echo training target: ${da_1}-${rate_name_1}-${da_2}-${rate_name_2}

        model_save_path=./output_auto/unsup-consert-base-${da_1}-${rate_name_1}-${da_2}-${rate_name_2}
        python3 main.py --no_pair --seed 1 --use_apex_amp --apex_amp_opt_level O1 --batch_size 96 --max_seq_length 64 --evaluation_steps 200 --add_cl --cl_loss_only --cl_rate 0.15 --temperature 0.1 --learning_rate 0.0000005 --train_data stssick --num_epochs 10 --da_final_1 ${da_1} --da_final_2 ${da_2} --cutoff_rate_final_1 ${cutoff_rate_1} --cutoff_rate_final_2 ${cutoff_rate_2} --model_name_or_path ./bert-base-uncased/ --model_save_path ${model_save_path} --force_del --no_dropout --patience 10

    done
done

