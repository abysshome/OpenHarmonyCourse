@Entry
@Component
struct Index {
  @State imgUrl:string=""
  @State message:string=""
  @State count:number=0;
  @State isSchool:boolean=false
  @State arr:Array<string>=["张三","李四","王五","xwb","yln"]

  build() {
    Row() {
      // Image(this.imgUrl)
      //   .width(100)
      //   .aspectRatio(1)
      //   .onClick(()=>{
      //
      //   })
      // if(this.isSchool){
      //   Text("张三在学校")
      //     .width(100)
      //     .aspectRatio(1)
      //     .backgroundColor(Color.Pink)
      // }else{
      //   Image(this.imgUrl)
      //     .width(100)
      //     .aspectRatio(1)
      //
      // }
      List() {
        ForEach(this.arr, (item:string, index: number) => {
          ListItem() {
            // 使用 Row 布局，图片在左，文本在右
            Row() {
              // 图片
              Image($r("app.media.startIcon")) // 使用资源引用
                .width(80)
                .height(80)
                .borderRadius(10)
                .margin({ right: 40 }) // 图片与文本之间的间距

              // 右侧的文本区域
              Column() {
                // 标题文本
                Text("第" + (index+1).toString() + "篇文章")
                  .fontSize(30)
                  .fontWeight(FontWeight.Bold)
                  .textAlign(TextAlign.Start) // 文本左对齐
                  .margin(5)

                // 描述文本
                Text("文章简介内容")
                  .fontSize(20)
                  .textAlign(TextAlign.Start) // 文本左对齐
                  .fontColor("#888888")
              }
              .justifyContent(FlexAlign.SpaceBetween) // 让两段文字均匀分布
              .height(80) // 确保文本区域高度与图片一致
            }
            .width("100%") // 占满父容器宽度
            .height(100) // 设置固定高度
            .padding(30) // 内边距
          }
          .margin(10)
          .borderRadius(20)
          .backgroundColor(Color.Pink)
        }, (item: string) => item)
          .onMove((from: number, to: number) => {
            let tmp = this.arr.splice(from, 1);
            this.arr.splice(to, 0, tmp[0]);
          })
      }
      .width('100%')
      .height('100%')
      // .backgroundColor("#FFDCDCDC")
      // .margin(10)
    }
  }

  // updateResult() {
  //   // 拼接输入框A和输入框B的内容
  //   this.result = `${this.inputA} ${this.inputB}`;
  //   this.inputA=this.inputA;
  //   this.inputA=this.inputA;
  // }
}