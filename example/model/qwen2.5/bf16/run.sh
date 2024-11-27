export SGLANG_FLASHINFER_USE_TENSOR_CORE=true 
nsys profile \
-o ./qwen2.5_3b_fp8_sgl.nsys-rep -ftrue \
-t cuda,nvtx,osrt --delay=5 \
--cuda-graph-trace=node \
--cudabacktrace=all \
python3 -m sglang.bench_offline_throughput \
--model ./Qwen2.5-3B \
--enable-torch-compile  \
--dataset-name random \
--num-prompt 1 --random-input 6000 --random-output 128 --random-range 1
