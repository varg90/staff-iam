import consumer from "channels/consumer";

consumer.subscriptions.create(
  { channel: "UserChannel", id: 1 },
  {
    connected() {
      console.log("✅ Connected to UserChannel");
    },

    disconnected() {
      console.log("🔌 Disconnected from UserChannel");
    },

    received(data) {
      if (data.type === "user_info") {
        console.log("👤 User info:", data);
      } else {
        console.log("📩 Received:", data);
      }
    },
  },
);
