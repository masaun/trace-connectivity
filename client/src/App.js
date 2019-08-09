import React, { Component } from "react";
import getWeb3, { getGanacheWeb3, Web3 } from "./utils/getWeb3";
import Header from "./components/Header/index.js";
import Footer from "./components/Footer/index.js";
import Hero from "./components/Hero/index.js";
import Web3Info from "./components/Web3Info/index.js";

import { Loader, Button, Card, Input, Heading, Table, Form } from 'rimble-ui';
import { Grid } from 'react-bootstrap';

import { LineChart, Line, XAxis, YAxis, BarChart, Bar, PieChart, Pie, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts'
import { moment } from 'moment'

import { zeppelinSolidityHotLoaderOptions } from '../config/webpack';

import styles from './App.module.scss';


class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      /////// Default state
      storageValue: 0,
      web3: null,
      accounts: null,
      route: window.location.pathname.replace("/",""),

      /////// School Registry
      countryName: '', 
      schoolName: '', 
      uploadSpeedStantdard: '',
      downloadSpeedStantdard: '',
      valueOfCountryName: '', 
      valueOfSchoolName: '', 
      valueOfUploadSpeedStantdard: '',
      valueOfDownloadSpeedStantdard: '',

      /////// SchoolId search
      valueOfSchoolId: 0,

      /////// Real-time data of school connectivity
      uploadSpeedCurrently: 0, 
      downloadSpeedCurrently: 0,
      timestamp: 0,

      realTimeDataList: [],
      schoolList:[]
    };

    this.handleInputIspName = this.handleInputIspName.bind(this);
    this.handleInputIspAddress = this.handleInputIspAddress.bind(this);
    this.sendIspRegister = this.sendIspRegister.bind(this);

    this.handleInputCountryName = this.handleInputCountryName.bind(this);
    this.handleInputSchoolName = this.handleInputSchoolName.bind(this);
    this.handleInputUploadSpeedStantdard = this.handleInputUploadSpeedStantdard.bind(this);
    this.handleInputDownloadSpeedStantdard = this.handleInputDownloadSpeedStantdard.bind(this);
    this.sendSchoolRegister = this.sendSchoolRegister.bind(this);

    this.handleInputSchoolId = this.handleInputSchoolId.bind(this);
    this.sendSchoolDetail = this.sendSchoolDetail.bind(this);

    this.getRealTimeData = this.getRealTimeData.bind(this);
  }


  ///////--------------------- ISP Registry ---------------------------
  handleInputIspName({ target: { value } }) {
    this.setState({ valueOfIspName: value });
  }

  handleInputIspAddress({ target: { value } }) {
    this.setState({ valueOfIspAddress: value });
  }

  sendIspRegister = async (event) => {
    const { accounts, trace_connectivity, valueOfIspName, valueOfIspAddress } = this.state;

    const response = await trace_connectivity.methods.ispRegistry(valueOfIspName, valueOfIspAddress).send({ from: accounts[0] })
    console.log('=== response of ispRegistry function ===', response);  // Debug

    this.setState({
      isp_name: valueOfIspName, 
      isp_address: valueOfIspAddress, 
      valueOfIspName: '', 
      valueOfIspAddress: '', 
    });
  }


  ///////--------------------- School Registry ---------------------------
  handleInputCountryName({ target: { value } }) {
    this.setState({ valueOfCountryName: value });
  }

  handleInputSchoolName({ target: { value } }) {
    this.setState({ valueOfSchoolName: value });
  }

  handleInputUploadSpeedStantdard({ target: { value } }) {
    this.setState({ valueOfUploadSpeedStantdard: Number(value) });
  }

  handleInputDownloadSpeedStantdard({ target: { value } }) {
    this.setState({ valueOfDownloadSpeedStantdard: Number(value) });
  }

  sendSchoolRegister = async (event) => {
    const { accounts, trace_connectivity, valueOfCountryName, valueOfSchoolName, valueOfUploadSpeedStantdard, valueOfDownloadSpeedStantdard } = this.state;

    const _countryName = valueOfCountryName
    const _schoolName = valueOfSchoolName
    const _uploadSpeedStantdard = valueOfUploadSpeedStantdard
    const _downloadSpeedStantdard = valueOfDownloadSpeedStantdard

    const response = await trace_connectivity.methods.schoolRegistry(_countryName, _schoolName, _uploadSpeedStantdard, _downloadSpeedStantdard).send({ from: accounts[0] })
    console.log('=== response of schoolRegistry function ===', response);  // Debug

    this.setState({
      countryName: _countryName, 
      schoolName: _schoolName, 
      uploadSpeedStantdard: _uploadSpeedStantdard,
      downloadSpeedStantdard: _downloadSpeedStantdard,
      valueOfCountryName: '', 
      valueOfSchoolName: '', 
      valueOfUploadSpeedStantdard: '',
      valueOfDownloadSpeedStantdard: ''
    });
  }


  ///////--------------------- SchoolId search ---------------------------
  handleInputSchoolId({ target: { value } }) {
    this.setState({ valueOfSchoolId: Number(value) });
  }

  sendSchoolDetail = async () => {
    const { accounts, trace_connectivity, valueOfSchoolId } = this.state;
    const _schoolId = valueOfSchoolId;
    
    const response = await trace_connectivity.methods.currentRightOfIsp(_schoolId).call();
        console.log('=== response of currentRightOfIsp function ===', response);
  }


  ///////--------------------- logic of judging Real-Time data ---------------------------
  
  /* @dev This is trigger function for getting real-time data for only DEMO */
  getRealTimeData = async () => {
    const { accounts, trace_connectivity } = this.state;

    // Sample data
    const _oldIspId = 1
    const _newIspId = 2
    const _newIspAddr = '0xc3871a0d61809e072e296b86bfd29f75abb93ad2'
    const _schoolId = 1

    const realTimeData = {
      uploadSpeedCurrently: 100,
      downloadSpeedCurrently: 100,
      timestamp: 15440340
    }

    const standardValueOfUploadSpeed = 90
    const standardValueOfDownloadSpeed = 110

    if (realTimeData['uploadSpeedCurrently'] > standardValueOfUploadSpeed) {
      console.log('======= Satisfy standard value of upload speed ======')  // OK
    } else {
      console.log('======= Does not Satisfy standard value of upload speed ======')  // OK
      const response = await trace_connectivity.methods.transferRightOfIsp(_oldIspId, _newIspId, _newIspAddr, _schoolId).send({ from: accounts[0] })
    }

    if (realTimeData['downloadSpeedCurrently'] > standardValueOfDownloadSpeed) {
      console.log('======= Satisfy standard value of download speed ======')  // OK
    } else {
      console.log('======= Does not Satisfy standard value of download speed ======')  // OK
      const response = await trace_connectivity.methods.transferRightOfIsp(_oldIspId, _newIspId, _newIspAddr, _schoolId).send({ from: accounts[0] })
    }



    // Save real-time data
    this.setState({
      uploadSpeedCurrently: realTimeData['uploadSpeedCurrently'], 
      downloadSpeedCurrently: realTimeData['downloadSpeedCurrently'],
      timestamp: realTimeData['timestamp']
    });


    // Add value above to realTimeDataList
    this.state.realTimeDataList.push({
      uploadSpeedCurrently: realTimeData['uploadSpeedCurrently'], 
      downloadSpeedCurrently: realTimeData['downloadSpeedCurrently'],
      timestamp: realTimeData['timestamp']
    });

    this.setState({
      realTimeDataList: this.state.realTimeDataList
    });

  }



  //////////////////////////////////// 
  ///// Ganache
  ////////////////////////////////////
  getGanacheAddresses = async () => {
    if (!this.ganacheProvider) {
      this.ganacheProvider = getGanacheWeb3();
    }
    if (this.ganacheProvider) {
      return await this.ganacheProvider.eth.getAccounts();
    }
    return [];
  }

  componentDidMount = async () => {
    const hotLoaderDisabled = zeppelinSolidityHotLoaderOptions.disabled;
    let Asset = {};
    let Exchange = {};
    let TraceConnectivity = {};

    try {
      Asset = require("../../build/contracts/Asset.json");        // Load ABI of contract of Asset
      Exchange = require("../../build/contracts/Exchange.json");  // Load ABI of contract of Exchange
      TraceConnectivity = require("../../build/contracts/TraceConnectivity.json");  // Load ABI of contract of TraceConnectivity
      // Asset = require("../../contracts/Asset.sol");
      // Exchange = require("../../contracts/Exchange.sol");
    } catch (e) {
      console.log(e);
    }

    try {
      const isProd = process.env.NODE_ENV === 'production';
      if (!isProd) {
        // Get network provider and web3 instance.
        const web3 = await getWeb3();
        let ganacheAccounts = [];

        try {
          ganacheAccounts = await this.getGanacheAddresses();
        } catch (e) {
          console.log('Ganache is not running');
        }

        // Use web3 to get the user's accounts.
        const accounts = await web3.eth.getAccounts();
        // Get the contract instance.
        const networkId = await web3.eth.net.getId();
        const networkType = await web3.eth.net.getNetworkType();
        const isMetaMask = web3.currentProvider.isMetaMask;
        let balance = accounts.length > 0 ? await web3.eth.getBalance(accounts[0]): web3.utils.toWei('0');
        balance = web3.utils.fromWei(balance, 'ether');

        let instanceAsset = null;
        let instanceExchange = null;
        let instanceTraceConnectivity = null;
        let deployedNetwork = null;

        if (Asset.networks) {
          deployedNetwork = Asset.networks[networkId.toString()];
          if (deployedNetwork) {
            instanceAsset = new web3.eth.Contract(
              Asset.abi,
              deployedNetwork && deployedNetwork.address,
            );
            console.log('=== instanceAsset ===', instanceAsset);
          }
        }
        if (Exchange.networks) {
          deployedNetwork = Exchange.networks[networkId.toString()];
          if (deployedNetwork) {
            instanceExchange = new web3.eth.Contract(
              Exchange.abi,
              deployedNetwork && deployedNetwork.address,
            );
            console.log('=== instanceExchange ===', instanceExchange);
          }
        }
        if (TraceConnectivity.networks) {
          deployedNetwork = TraceConnectivity.networks[networkId.toString()];
          if (deployedNetwork) {
            instanceTraceConnectivity = new web3.eth.Contract(
              TraceConnectivity.abi,
              deployedNetwork && deployedNetwork.address,
            );
            console.log('=== instanceTraceConnectivity ===', instanceTraceConnectivity);
          }
        }

        if (instanceAsset || instanceExchange || instanceTraceConnectivity) {
          // Set web3, accounts, and contract to the state, and then proceed with an
          // example of interacting with the contract's methods.
          this.setState({ web3, ganacheAccounts, accounts, balance, networkId, networkType, hotLoaderDisabled,
            isMetaMask, asset: instanceAsset, exchange: instanceExchange, trace_connectivity: instanceTraceConnectivity }, () => {
              this.refreshValues(instanceAsset, instanceExchange, instanceTraceConnectivity);
              setInterval(() => {
                this.refreshValues(instanceAsset, instanceExchange, instanceTraceConnectivity);
              }, 5000);
            });
        }
        else {
          this.setState({ web3, ganacheAccounts, accounts, balance, networkId, networkType, hotLoaderDisabled, isMetaMask });
        }
      }
    } catch (error) {
      // Catch any errors for any of the above operations.
      alert(
        `Failed to load web3, accounts, or contract. Check console for details.`,
      );
      console.error(error);
    }
  };

  componentWillUnmount() {
    if (this.interval) {
      clearInterval(this.interval);
    }
  }

  refreshValues = (instanceAsset, instanceExchange, instanceTraceConnectivity) => {
    if (instanceAsset) {
      console.log('refreshValues of instanceAsset');
    }
    if (instanceExchange) {
      console.log('refreshValues of instanceExchange');
    }
    if (instanceTraceConnectivity) {
      console.log('refreshValues of instanceTraceConnectivity');
    }
  }

  renderLoader() {
    return (
      <div className={styles.loader}>
        <Loader size="80px" color="red" />
        <h3> Loading Web3, accounts, and contract...</h3>
        <p> Unlock your metamask </p>
      </div>
    );
  }

  renderDeployCheck(instructionsKey) {
    return (
      <div className={styles.setup}>
        <div className={styles.notice}>
          Your <b> contracts are not deployed</b> in this network. Two potential reasons: <br />
          <p>
            Maybe you are in the wrong network? Point Metamask to localhost.<br />
            You contract is not deployed. Follow the instructions below.
          </p>
        </div>
      </div>
    );
  }

  renderInstructions() {
    return (
      <div className={styles.wrapper}>
        <Hero />
      </div>
    );
  }

  renderRegistry() {
    return (
      <div className={styles.wrapper}>
      {!this.state.web3 && this.renderLoader()}
      {this.state.web3 && !this.state.trace_connectivity && (
        this.renderDeployCheck('trace_connectivity')
      )}
      {this.state.web3 && this.state.asset && (
        <div className={styles.contracts}>
          <h1>Trace Connectivity Contract is good to Go!</h1>
          <div className={styles.widgets}>
            <Card width={'350px'} bg="primary">
              <h2>ISP Registry</h2>
              <p>ISP name</p>
              <Input type="text" value={this.state.valueOfIspName} onChange={this.handleInputIspName} />

              <p>ISP account address</p>
              <Input type="text" value={this.state.valueOfIspAddress} onChange={this.handleInputIspAddress} />

              <br />
              
              <Button onClick={this.sendIspRegister}>ISP Register</Button>
            </Card>

            <Card width={'350px'} bg="primary">
              <h2>Donor Registry</h2>
              <p>Donor name</p>
              <Input type="text" value={this.state.valueOfIspName} onChange={this.handleInputIspName} />

              <p>Donor account address</p>
              <Input type="text" value={this.state.valueOfIspAddress} onChange={this.handleInputIspAddress} />

              <br />
              
              <Button onClick={this.sendIspRegister}>Donor Register</Button>
            </Card>
          </div>
        </div>
      )}
      </div>
    );
  }

  renderFund() {
    return (
      <div className={styles.wrapper}>
      {!this.state.web3 && this.renderLoader()}
      {this.state.web3 && !this.state.trace_connectivity && (
        this.renderDeployCheck('trace_connectivity')
      )}
      {this.state.web3 && this.state.asset && (
        <div className={styles.contracts}>
          <h1>Trace Connectivity Contract is good to Go!</h1>
          <div className={styles.widgets}>
            <Card width={'350px'} bg="primary">
              <h2>Fund from donors</h2>
              <p>Donor address</p>
              <Input type="text" value={this.state.valueOfIspName} onChange={this.handleInputIspName} />

              <p>Fund amount from donor</p>
              <Input type="text" value={this.state.valueOfIspAddress} onChange={this.handleInputIspAddress} />

              <br />
              
              <Button onClick={this.sendIspRegister}> Fund（Donate）</Button>
            </Card>
          </div>
        </div>
      )}
      </div>
    );
  }

  renderSchool() {
    return (
      <div className={styles.wrapper}>
      {!this.state.web3 && this.renderLoader()}
      {this.state.web3 && !this.state.trace_connectivity && (
        this.renderDeployCheck('trace_connectivity')
      )}
      {this.state.web3 && this.state.trace_connectivity && (
        <div className={styles.contracts}>
          <h1>This page can register specific school</h1>
          <div className={styles.widgets}>
            <Card width={'350px'} bg="primary">
              <h2>School Registry</h2>
              <p>Country name</p>
              <Input type="text" value={this.state.valueOfCountryName} onChange={this.handleInputCountryName} />

              <p>School name</p>
              <Input type="text" value={this.state.valueOfSchoolName} onChange={this.handleInputSchoolName} />

              <p>Stantdard value of upload speed</p>
              <Input type="text" value={this.state.valueOfUploadSpeedStantdard} onChange={this.handleInputUploadSpeedStantdard} />

              <p>Stantdard value of download speed</p>
              <Input type="text" value={this.state.valueOfDownloadSpeedStantdard} onChange={this.handleInputDownloadSpeedStantdard} />

              <br />
              
              <Button onClick={this.sendSchoolRegister}>School Register</Button>
            </Card>
          </div>
        </div>
      )}
      </div>
    );
  }

  renderSchoolConnectivity() {
    const { accounts, trace_connectivity, uploadSpeedCurrently, downloadSpeedCurrently, realTimeDataList } = this.state;

    const dataUploadSpeed = [
      { name: '8/7', uploadSpeedStandard: 10, uploadSpeedCurrently: 12 },
      { name: '8/8', uploadSpeedStandard: 10, uploadSpeedCurrently: 13 },
      { name: '8/9', uploadSpeedStandard: 10, uploadSpeedCurrently: 19 },
      { name: '8/10', uploadSpeedStandard: 10, uploadSpeedCurrently: 11 },
      { name: '8/11', uploadSpeedStandard: 10, uploadSpeedCurrently: 9 },
      { name: '8/12', uploadSpeedStandard: 10, uploadSpeedCurrently: 22 }
    ]

    const dataDownloadSpeed = [
      { name: '8/7', downloadSpeedStandard: 15, downloadSpeedCurrently: 5 },
      { name: '8/8', downloadSpeedStandard: 15, downloadSpeedCurrently: 3 },
      { name: '8/9', downloadSpeedStandard: 15, downloadSpeedCurrently: 9 },
      { name: '8/10', downloadSpeedStandard: 15, downloadSpeedCurrently: 10 },
      { name: '8/11', downloadSpeedStandard: 15, downloadSpeedCurrently: 12 },
      { name: '8/12', downloadSpeedStandard: 15, downloadSpeedCurrently: 13 }
    ]

    return (
      <div className={styles.wrapper}>
      {!this.state.web3 && this.renderLoader()}
      {this.state.web3 && !this.state.trace_connectivity && (
        this.renderDeployCheck('trace_connectivity')
      )}
      {this.state.web3 && this.state.asset && (
        <div className={styles.contracts}>
          <h1>This page can see status of connectivity depends on school</h1>

          <Card width={'350px'} bg="primary">
            <Button onClick={this.getRealTimeData}>Get Real-Time Data</Button>
          </Card>

          <div className={styles.widgets}>
            <Card width={'350px'} bg="primary">
              <h2>School Id Search</h2>
              <Input type="text" value={this.state.valueOfSchoolId} onChange={this.handleInputSchoolId} />

              <br />

              <Button onClick={this.sendSchoolDetail}>Search School Detail</Button>
            </Card>
          </div>

          <div className={styles.widgets}>
            <Card width={'350px'} bg="primary">
              <h2>Status of specific school connectivity</h2>
              <p>Country name</p>

              <p>School name</p>

              <p>Assigned ISP name (currently)</p>

              <hr />

              <p>Stantdard value of upload speed</p>

              <p>Current value of upload speed</p>

              <hr />
 
              <p>Stantdard value of download speed</p>

              <p>Current value of download speed</p>

            </Card>

            <Card width={'400px'} bg="primary">
              <ResponsiveContainer width="80%" height="40%" minWidth={600} minHeight={400}>
                <LineChart data={dataUploadSpeed}>
                  <XAxis dataKey="name" />
                  <YAxis />
                  <Line dataKey="uploadSpeedStandard" stroke="#FF0000" />
                  <Line dataKey="uploadSpeedCurrently" stroke="#82ca9d" />
                </LineChart>
              </ResponsiveContainer>

              <ResponsiveContainer width="80%" height="40%" minWidth={600} minHeight={400}>
                <LineChart data={dataDownloadSpeed}>
                  <XAxis dataKey="name" />
                  <YAxis />
                  <Line dataKey="downloadSpeedStandard" stroke="#FF0000" />
                  <Line dataKey="downloadSpeedCurrently" stroke="#8884d8" />
                </LineChart>
              </ResponsiveContainer>
            </Card>
          </div>
        </div>
      )}
      </div>
    );
  }

  render() {
    return (
      <div className={styles.App}>
        <Header />
          {this.state.route === '' && this.renderInstructions()}
          {this.state.route === 'registry' && this.renderRegistry()}
          {this.state.route === 'fund' && this.renderFund()}          
          {this.state.route === 'school' && this.renderSchool()}
          {this.state.route === 'school_connectivity' && this.renderSchoolConnectivity()}
        <Footer />
      </div>
    );
  }
}

export default App;
