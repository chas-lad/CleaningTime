const functions = require("firebase-functions");

const admin = require("firebase-admin");
admin.initializeApp();

// Scheduled function runs every day at 12 AM to reset the 'isDone'
// key to false for each document in the 'todos' collection.
exports.scheduledFunctionSet_IsDone_ToFalse = functions.pubsub
    .schedule("0 0 * * *")
    .onRun(async (context) => {
      const snapshot = await admin.firestore().collection("todos").get();

      await Promise.all(snapshot.docs.map((doc) =>
        doc.ref.update({isDone: false})));
    });

// Scheduled function runs every Monday at 12 AM to reset the 'completed'
// key to false for each document in the 'users' collection.
exports.scheduledFunctionSet_Completed_ToFalse = functions.pubsub
    .schedule("0 0 * * 1")
    .onRun(async (context) => {
      const snapshot = await admin.firestore().collection("users").get();

      await Promise.all(snapshot.docs.map((doc) =>
        doc.ref.update({completed: false})));
    });
