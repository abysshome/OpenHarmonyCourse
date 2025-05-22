@Entry
@Component
struct homework1 {
  @State inputA: string = ''; // 输入框A的值
  @State inputB: string = ''; // 输入框B的值
  @State result: string = ''; // 第三行显示的结果

  build() {
    Column({ space: 20 }) { // 主列布局，设置间距为20
      // 第一行：粉色圆形按钮
      Row() {
        Button('点击', { type: ButtonType.Normal })
          .width(80)
          .height(80)
          .backgroundColor(Color.Pink)
          .borderRadius(40) // 圆形按钮
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
          .onClick(() => {
            // 点击按钮时，输入框A中的数字自动+1
            const num = parseInt(this.inputA, 10);//
            if (!isNaN(num)) {
              this.inputA = (num + 1).toString();
              this.updateResult(); // 更新结果
            }
          });
      }
      .justifyContent(FlexAlign.Center); // 居中对齐

      // 第二行：两个输入框和“+”号
      Row({ space: 10 }) {
        TextInput({ placeholder:'请输入',text:this.inputA})
          .width('40%')
          .backgroundColor(Color.Yellow)
          .fontSize(20)
          .placeholderFont({
            size: 20,
            weight: FontWeight.Normal,
          })
          .fontColor(Color.Black) // 输入字符颜色为黑色
          .onChange((value: string) => {
            console.log(`Input A changed: ${value}`);
            // 限制输入框A只能输入数字
            this.inputA = value.replace(/[^0-9]/g, '');
            this.updateResult(); // 调用更新结果的方法
          });

        Text('+') // “+”号
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            console.log('Plus button clicked');
            this.updateResult(); // 点击“+”号时更新结果
          });

        TextInput({placeholder:'请输入'})
          .width('40%')
          .backgroundColor(Color.Yellow)
          .placeholderFont({
            size: 20,
            weight: FontWeight.Normal,
          })
          .fontColor(Color.Black) // 输入字符颜色为黑色
          .onChange((value: string) => {
            console.log(`Input B changed: ${value}`);
            this.inputB = value; // 输入框B可以输入任意字符
            this.updateResult(); // 调用更新结果的方法
          });
      }
      .justifyContent(FlexAlign.Center); // 居中对齐

      // 第三行：显示结果
      Row() {
        Text(this.result || '无结果') // 显示拼接后的字符串，如果没有结果则显示默认文本
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black);
      }
      .justifyContent(FlexAlign.Center); // 居中对齐
    }
    .width('100%')
    .height('100%')
    .padding(20); // 添加内边距
  }

  updateResult() {
    // 拼接输入框A和输入框B的内容
    this.result = `${this.inputA} ${this.inputB}`;
    this.inputA=this.inputA;
    this.inputA=this.inputA;
  }
}