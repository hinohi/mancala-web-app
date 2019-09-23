const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const distPath = path.resolve(__dirname, 'dist');

const appConfig = {
    entry: './js/index.js',
    output: {
        path: distPath,
        filename: 'index.js',
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: 'index.html'
        }),
    ],
    module: {
        rules: [
            {
                test: /\.elm$/,
                exclude: [/elm-stuff/, /node_modules/],
                use: [
                    {
                        loader: "elm-webpack-loader",
                        options: {
                            debug: true,
                            forceWatch: true
                        }
                    }
                ]
            }
        ]
    },
    mode: 'development'
};

module.exports = [appConfig];
