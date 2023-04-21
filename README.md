# CIS 5220 Deep Learning Project
Team: Query Marksmen

This project explores various approaches and deep learning models
for the Text-to-SQL task, which aims to convert natural language questions into SQL queries, enabling seamless interaction between users and
databases. Text-to-SQL research helps to bridge the gap between everyday users and complex database systems, empowering individuals with
diverse technical expertise to harness the potential of data. We explore non-deep learning, basic deep learning, and advanced deep learning models, 
applying them to the Spider dataset—a diverse collection of text-SQL query pairs. We evaluate these models’ performance on complex
text-to-SQL tasks and analyze the associated challenges. Our advanced
models leverage deep learning techniques, including customizing and fine-
tuning T5 models and utilizing the GPT-3.5-turbo model with prompt
engineering in a zero-shot approach. Additionally, we implement data
preprocessing, L2 regularization, and efficient fine-tuning techniques to
enhance model performance. Our project suggests that advanced models significantly outperform the base models, demonstrating the potential
for achieving higher accuracy with more complex models and additional resources.

## Non-DL and base DL models
1. [Random forest model & RNN-based model](./non_dl_base_dl.ipynb)

## Advanced DL models
### T5 fine-tuning
1. [T5-base without database schema and without regularization](./t5_base_no_db_no_reg.ipynb)
2. [T5-base with database schema but without regularization](./t5_base_with_db_no_reg.ipynb)
3. [T5-base with database schema and with regularization strengh = 1e-5](./t5_base_with_db_reg_1e-5.ipynb)
4. [T5-base with database schema and with regularization strengh = 1e-2](./t5_base_with_db_reg_1e-2.ipynb)
5. [T5-large with database schema and with regularization strengh = 1e-2](./t5_large_with_db_reg_1e-2.ipynb)

### GPT-3.5-turbo
1. [GPT-3.5-turbo](./gpt3.5_turbo_with_db.ipynb)
