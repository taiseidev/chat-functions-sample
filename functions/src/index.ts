const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp(functions.config().firebase);
var firestore = admin.firestore();

// ランダムなユーザーにメッセージを送信する関数
export const sendMessageSomeone = functions
  .region("asia-northeast1")
  .https.onRequest(
    async (
      request: { body: { [x: string]: { [x: string]: string } } },
      response: {
        status: (arg0: number) => {
          (): any;
          new (): any;
          send: { (arg0: { status: number; data: string }): void; new (): any };
        };
      }
    ) => {
      var deviceToken = firestore.collection("user").doc().get();
      console.log(deviceToken);
      //       var deviceToken = firestore
      //         .collection("user")
      //         .doc()
      //         .get()
      //         .then((doc: any) =>
      //           doc.docs.forEach((element: any) => element.first["deviceToken"])
      //         );
      //       console.log(deviceToken);
      // アプリにレスポンスを返す。
      //       response.status(200).send({
      //         data: { result: "送信が完了しました" },
      //       });
      sendPushNotification(
        "f-R8uHy-UUbbkweKz6OGXC:APA91bHVMIeOajy_F_O639fLAwTv17Mf_inRR16irZqDK4b_l7M_P-LigXN98fdcn5Yb5UKI_m__NZUdYr8nG_4mnsDVj9-6JPVcu_eb0zPpPu76EPbW6LLj64VKXakSiJIM1ZeUxRQb",
        "通知テスト",
        "TypeScript意味わからなさすぎです。"
      );
    }
  );

// payloadを指定
const sendPushNotification = function (
  token: string,
  title: string,
  body: string
) {
  const payload = {
    notification: {
      title: title,
      body: body,
      sound: "default",
    },
  };
  const option = {
    priority: "high",
  };
  admin.messaging().sendToDevice(token, payload, option);
};
