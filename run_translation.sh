for d in `ls data/lct_seq2seq`; do
   python3 src/run_translation_no_trainer.py \
      --model_name_or_path t5-base \
      --source_lang intent \
      --target_lang snippet \
      --source_prefix code \
      --train_file "./data/lct_seq2seq/$d/train.json" \
      --validation_file "./data/lct_seq2seq/$d/test.json" \
      --dataset_config_name lct \
      --output_dir ./output/"lct_$d" \
      --per_device_train_batch_size=4 \
      --per_device_eval_batch_size=4 \
      --predict_with_generate=1
done

