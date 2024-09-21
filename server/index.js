const express = require("express");

const app = express();

PORT = 3000;

app.listen(PORT,"0.0.0.0" ,() => {
    console.log(`Server is running on port ${PORT}`);
});