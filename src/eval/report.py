import os
import json

scores = []

for d in os.listdir('./output'):
    filepath = os.path.join('./output', d, 'best_score.json')
    if os.path.exists(filepath):
        with open(filepath, 'r') as fin:
            score = json.loads(fin.read())['eval_bleu']
            scores.append([d, score])

highest = max([x[1] for x in scores])
for name, score in sorted(scores, key=lambda x: x[1], reverse=True):
    print(f'{name.ljust(25)}: {score}{"*" if score == highest else ""}')
