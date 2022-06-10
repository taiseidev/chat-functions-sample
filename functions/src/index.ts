import functions = require("firebase-functions");
import admin = require("firebase-admin");
admin.initializeApp();

// method to send a message to a random user
export const sendMessageSomeone = functions
  .region("asia-northeast1")
  .https.onRequest(async (request: any, response: any) => {
    if (request.method != "POST") {
      response
        .status(400)
        .send("予期しないエラーが発生しました。再度お試しください");
    }
    try {
      console.log(`deviceToken:${request.body["currentUserId"]}`);
      sendPushNotification(
        request.body["currentUserId"],
        "送信しました",
        `○○さんにチャット依頼を送信しました。`
      );
      response.send({
        name: "大西 泰生",
        deviceToken: request.body["currentUserId"],
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
