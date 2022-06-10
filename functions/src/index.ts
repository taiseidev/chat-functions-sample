import functions = require("firebase-functions");
import admin = require("firebase-admin");
admin.initializeApp();

// method to send a message to a random user
export const sendMessageSomeone = functions
  .region("asia-northeast1")
  .https.onRequest(async (request: any, response: any) => {
    try {
      const snapshot = await admin
        .firestore()
        .doc("user/bR8PdYVVksSQvP1v0bwwIsmIiCM2")
        .get();
      const data = snapshot.data();
      sendPushNotification(
        data!["deviceToken"],
        "チャット依頼を送信しました",
        `${data!["id"]}さんにチャットメッセージを送信しました。`
      );
      response.send(data);
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
