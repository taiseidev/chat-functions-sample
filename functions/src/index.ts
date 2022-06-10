import functions = require("firebase-functions");
import admin = require("firebase-admin");
admin.initializeApp();
const firestore = admin.firestore();

const UNEXPECTED_ERROR_MESSAGE =
  "予期しないエラーが発生しました。再度お試しください";
const MESSAGE_TITLE = "チャット依頼が届きました👀";

// method to send a message to a random user
export const sendMessageSomeone = functions
  .region("asia-northeast1")
  .https.onRequest(async (request: any, response: any) => {
    if (request.method != "POST") {
      response.status(400).send(UNEXPECTED_ERROR_MESSAGE);
    }
    const userSnapShot = await firestore.collection("user").get();
    const userList = userSnapShot.docs.map((doc) => doc.data());
    try {
      var randomNum = Math.floor(Math.random() * userList.length);
      console.log(randomNum);
      var deviceToken = userList[randomNum]["deviceToken"];

      var senderId = request["senderId"];
      console.log(`deviceToken:${deviceToken}`);
      sendPushNotification(
        deviceToken,
        MESSAGE_TITLE,
        `${senderId}さんと会話しよう💪`
      );
      response.send({
        deviceToken: deviceToken,
        num: randomNum,
      });
    } catch (error) {
      console.log(error);
      response.status(500).send(error);
    }
  });

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
