const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp(functions.config().firebase);
var firestore = admin.firestore();

// ランダムなユーザーにメッセージを送信する関数
export const sendMessageSomeone = functions
  .region("asia-northeast1")
  .https.onRequest((req: any, res: any) => async () => {
    var name: string = await firestore
      .collection("user")
      .get("FFqqVnaMHsfiYKmUfO3J2R6vLsy1")
      .then((doc: any) => {
        return doc.data().name;
      });
    console.log(name);

    // sendPushNotification(
    //   "dHgFM9pjvEX-hTxXVTw3hX:APA91bEwYnewmUU0gT6gwThwAXJMqqOPT43al_oYifjr9uc1-XR286vN2WDvvJ17y9iX5uGRRWfPiPggarzxGW66pMNfE1YwGl0LFujkV9bbr3SPbSYT4z6ILpne6Q4g3-xIjiJdzPa-",
    //   "通知テスト",
    //   "TypeScript意味わからなさすぎです。"
    // );
    res.status(200).send({
      result: name,
    });
    res.end();
  });

// payloadを指定
// const sendPushNotification = function (
//   token: string,
//   title: string,
//   body: string
// ) {
//   const payload = {
//     notification: {
//       title: title,
//       body: body,
//       sound: "default",
//     },
//   };
//   const option = {
//     priority: "high",
//   };
//   admin.messaging().sendToDevice(token, payload, option);
// };
