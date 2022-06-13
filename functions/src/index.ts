import functions = require("firebase-functions");
import admin = require("firebase-admin");
admin.initializeApp();
const firestore = admin.firestore();

const UNEXPECTED_ERROR_MESSAGE =
  "予期しないエラーが発生しました。再度お試しください";
const MESSAGE_TITLE = "チャット依頼が届きました👀";
const MESSAGE_BODY = "さんと会話しよう💪";

// method to send a message to a random user
export const sendMessageSomeone = functions
  .region("asia-northeast1")
  .https.onRequest(async (request: any, response: any) => {
    if (request.method != "POST") {
      response.status(400).send(UNEXPECTED_ERROR_MESSAGE);
    }
    const userSnapShot = await firestore.collection("user").get();
    const userList = userSnapShot.docs.map((doc) => doc.data());
    var randomNum = Math.floor(Math.random() * userList.length);
    var receiverId = userList[randomNum]["id"];
    var receiverName = userList[randomNum]["name"];
    var receiverDeviceToken = userList[randomNum]["deviceToken"];
    var data = request.body;
    var senderId = data["senderId"];
    var senderName = data["name"];
    var senderDeviceToken = data["deviceToken"];

    try {
      // add receiverInfo for sender collection
      await firestore.collection("user").doc(senderId).collection("send").add({
        name: receiverName,
        deviceToken: receiverDeviceToken,
        isChatted: false,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      });
      // add senderInfo for receiver collection
      await firestore
        .collection("user")
        .doc(receiverId)
        .collection("receive")
        .add({
          name: senderName,
          deviceToken: senderDeviceToken,
          isChatted: false,
          createdAt: admin.firestore.FieldValue.serverTimestamp(),
          updatedAt: admin.firestore.FieldValue.serverTimestamp(),
        });

      sendPushNotification(
        receiverDeviceToken,
        MESSAGE_TITLE,
        `大西${MESSAGE_BODY}`
      );
      response.send({
        deviceToken: receiverDeviceToken,
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
