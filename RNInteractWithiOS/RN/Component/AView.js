import React from 'react';
import {
  StyleSheet,
  Text,
  View,
  Button,
  NativeModules,
  DeviceEventEmitter
} from 'react-native';
import PropTypes from "prop-types";

const rn = NativeModules.RNCalliOS;

export default class AView extends React.Component {

  static defaultProps = {
    value: "",
  }

  static propTypes = {
    value: PropTypes.string.isRequired
  }

  render() {
    return (
      <View style={styles.container}>
        <Text>我是RN页面</Text>
        <Text>参数：{this.props.value.length > 0 ? this.props.value : "没有参数"}</Text>
        <Button
          onPress={this.transferIOS}
          title="RN调用iOS（无回调无参数）"
          color="#841584"
        />
        <Button
          onPress={this.transferIOS1}
          title="RN调用iOS（有参数）"
          color="#841584"
        />
        <Button
          onPress={this.transferIOS2}
          title="RN调用iOS（有回调）"
          color="#841584"
        />
        <Button
          onPress={this.transferIOS3}
          title="RN调用iOS（有参数有回调）"
          color="#841584"
        />
        <Button
          onPress={this.transferRN}
          title="RN通知调用"
          color="#841584"
        />
      </View>
    );
  }

  componentDidMount() {
    DeviceEventEmitter.addListener('iOSCallRN', () => {
      alert('iOSCallRN响应');
    });
    DeviceEventEmitter.addListener('iOSCallRNWithParameter', (msg) => {
      alert('iOSCallRNWithParameter接收到参数：' + msg);
    });
  }

  transferIOS = () => {
    rn.RNCalliOS();
  }

  transferIOS1 = () => {
    rn.RNCalliOSWithParameter('parame');
  }

  transferIOS2 = () => {
    rn.RNCalliOSWithCallBack((data) => {
      alert('RN响应回调成功\n' + data);
    });
  }

  transferIOS3 = () => {
    rn.RNCalliOSWithParameterAndCallBack('参数1', '参数2', { "value": "123" })
      .then(result => {
        alert('RN响应回调成功\n' + result);
      }).catch(error => {
      });
  }

  transferRN = () => {
    DeviceEventEmitter.emit('iOSCallRNWithParameter', "通知响应");
  }

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'green',
  },
  onBackSytle: {
    justifyContent: 'center',
    alignItems: 'center',
    position: 'absolute',
    left: 20,
    top: 80,
    width: 100,
    height: 50,
    backgroundColor: '#777777'
  }
});