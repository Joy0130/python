from flask import Flask, request, render_template
import random

app = Flask(__name__)

# 初始化全域變數
secret_number = random.randint(1, 100)
attempts = 0

def reset_game():
    global secret_number, attempts
    secret_number = random.randint(1, 100)
    attempts = 0

@app.route('/', methods=['GET', 'POST'])

def guess_the_number():
    global secret_number, attempts
    message = ""

    if request.method == 'POST':
        try:
            guess = int(request.form['guess'])
            attempts += 1

            if guess < 1 or guess > 100:
                message = "請輸入一個1到100之間的數字。"
            elif guess < secret_number:
                message = "太低了，試試更大的數字!"
            elif guess > secret_number:
                message = "太高了，試試更小的數字!"
            else:
                message = f"恭喜你猜中了! 答案是 {secret_number}，你總共用了 {attempts} 次機會。"
                reset_game()
        except ValueError:
            message = "請輸入有效的數字。"

    return render_template('index.html', message=message, attempts=attempts)
print("success13")
# 啟動伺服器
if __name__ == "__main__":
    app.run(host = '0.0.0.0',debug=True,port = 5002)