
# Path to checkpoint file.
# Notice there's no data-00000-of-00001 in the CHECKPOINT_PATH environment variable
# Also make sure you place model.ckpt-2000000.index (which is cloned from the repository)
# in the same location as model.ckpt-2000000.data-00000-of-00001
# You can use model.ckpt-1000000.data-00000-of-00001 similarly
CHECKPOINT_PATH="pretrained/model.ckpt-2000000"


# Vocabulary file generated by the preprocessing script.
# Since the tokenizer could be of a different version, use the word_counts.txt file supplied. 
VOCAB_FILE="pretrained/word_counts.txt"

# JPEG image file to caption.
IMAGE_FILE="sample_images/COCO_val2014_000000224477.jpg"

# Build the inference binary.
bazel build -c opt im2txt/run_inference

# Run inference to generate captions.
bazel-bin/im2txt/run_inference \
  --checkpoint_path=${CHECKPOINT_PATH} \
  --vocab_file=${VOCAB_FILE} \
  --input_files=${IMAGE_FILE}
