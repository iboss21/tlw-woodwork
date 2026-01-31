// The Last Wolves - Woodwork UI JavaScript

const WoodworkUI = {
    // Constants
    NOTIFICATION_DURATION: 5000, // milliseconds
    NOTIFICATION_FADE_DURATION: 300, // milliseconds
    
    // UI State
    isOpen: false,
    currentTab: 'overview',
    data: {
        lumberStock: 0,
        dailyRevenue: 0,
        workerCount: 0,
        efficiency: 0,
        licenseType: 'None',
        campLevel: 1,
        monthlyCosts: 0,
        workers: [],
        skills: [],
        processingQueue: []
    },

    // Initialize UI
    init() {
        console.log('Initializing Woodwork UI...');
        this.setupEventListeners();
        this.setupNUICallbacks();
    },

    // Setup Event Listeners
    setupEventListeners() {
        // Tab Navigation
        document.querySelectorAll('.nav-tab').forEach(tab => {
            tab.addEventListener('click', (e) => {
                this.switchTab(e.target.dataset.tab);
            });
        });

        // Close Button
        document.getElementById('close-ui').addEventListener('click', () => {
            this.close();
        });

        // Processing Controls
        const startBtn = document.getElementById('start-processing');
        const pauseBtn = document.getElementById('pause-processing');
        
        if (startBtn) {
            startBtn.addEventListener('click', () => {
                this.sendNUIMessage('startProcessing');
            });
        }
        
        if (pauseBtn) {
            pauseBtn.addEventListener('click', () => {
                this.sendNUIMessage('pauseProcessing');
            });
        }

        // Hire Worker Button
        const hireBtn = document.getElementById('hire-worker');
        if (hireBtn) {
            hireBtn.addEventListener('click', () => {
                this.sendNUIMessage('openHireMenu');
            });
        }

        // ESC key to close
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && this.isOpen) {
                this.close();
            }
        });
    },

    // Setup NUI Callbacks
    setupNUICallbacks() {
        window.addEventListener('message', (event) => {
            const data = event.data;

            switch (data.action) {
                case 'open':
                    this.open(data.data);
                    break;
                case 'close':
                    this.close();
                    break;
                case 'update':
                    this.update(data.data);
                    break;
                case 'notify':
                    this.notify(data.message, data.type);
                    break;
                case 'updateTab':
                    this.updateTabData(data.tab, data.data);
                    break;
            }
        });
    },

    // Open UI
    open(data) {
        console.log('Opening Woodwork UI');
        const ui = document.querySelector('.woodwork-ui');
        
        if (data) {
            this.data = { ...this.data, ...data };
        }
        
        ui.style.display = 'block';
        this.isOpen = true;
        this.updateAllData();
        this.sendNUIMessage('uiOpened');
    },

    // Close UI
    close() {
        console.log('Closing Woodwork UI');
        const ui = document.querySelector('.woodwork-ui');
        ui.style.display = 'none';
        this.isOpen = false;
        this.sendNUIMessage('uiClosed');
    },

    // Switch Tab
    switchTab(tabName) {
        // Update tab buttons
        document.querySelectorAll('.nav-tab').forEach(tab => {
            tab.classList.remove('active');
        });
        document.querySelector(`[data-tab="${tabName}"]`).classList.add('active');

        // Update tab content
        document.querySelectorAll('.tab-pane').forEach(pane => {
            pane.classList.remove('active');
        });
        document.getElementById(`${tabName}-tab`).classList.add('active');

        this.currentTab = tabName;
        this.sendNUIMessage('tabChanged', { tab: tabName });
    },

    // Update UI Data
    update(data) {
        this.data = { ...this.data, ...data };
        this.updateAllData();
    },

    // Update All Data in UI
    updateAllData() {
        // Update Overview Cards
        this.updateElement('lumber-stock', this.data.lumberStock);
        this.updateElement('daily-revenue', `$${this.data.dailyRevenue}`);
        this.updateElement('worker-count', this.data.workerCount);
        this.updateElement('efficiency', `${this.data.efficiency}%`);

        // Update Business Stats
        this.updateElement('license-type', this.data.licenseType);
        this.updateElement('camp-level', this.data.campLevel);
        this.updateElement('monthly-costs', `$${this.data.monthlyCosts}`);

        // Update Workers
        this.updateWorkers();

        // Update Skills
        this.updateSkills();

        // Update Processing Queue
        this.updateProcessingQueue();
    },

    // Update Element Text
    updateElement(id, value) {
        const element = document.getElementById(id);
        if (element) {
            element.textContent = value;
        }
    },

    // Update Workers List
    updateWorkers() {
        const workersList = document.getElementById('workers-list');
        if (!workersList) return;

        if (!this.data.workers || this.data.workers.length === 0) {
            workersList.innerHTML = '<div style="color: var(--text-light); text-align: center; padding: 40px;">No workers hired yet</div>';
            return;
        }

        workersList.innerHTML = this.data.workers.map(worker => `
            <div class="info-card">
                <div class="card-icon">${this.getWorkerIcon(worker.type)}</div>
                <div class="card-label">${worker.name}</div>
                <div style="margin: 10px 0;">
                    <div style="font-size: 0.9rem; margin: 5px 0;">Type: ${worker.type}</div>
                    <div style="font-size: 0.9rem; margin: 5px 0;">Efficiency: ${worker.efficiency}%</div>
                    <div style="font-size: 0.9rem; margin: 5px 0; color: var(--accent-gold);">Wage: $${worker.wage}/day</div>
                </div>
            </div>
        `).join('');
    },

    // Get Worker Icon
    getWorkerIcon(type) {
        const icons = {
            'camp_manager': '👔',
            'sawmill_operator': '🪚',
            'stock_handler': '📦',
            'guard': '🛡️',
            'stable_hand': '🐴'
        };
        return icons[type] || '👤';
    },

    // Update Skills List
    updateSkills() {
        const skillsList = document.getElementById('skills-list');
        if (!skillsList) return;

        if (!this.data.skills || this.data.skills.length === 0) {
            skillsList.innerHTML = '<div style="color: var(--text-light); text-align: center; padding: 40px;">No skills learned yet</div>';
            return;
        }

        skillsList.innerHTML = this.data.skills.map(skill => `
            <div class="skill-bar">
                <div class="skill-name">
                    <span>${skill.name}</span>
                    <span style="color: var(--accent-gold);">Level ${skill.level}</span>
                </div>
                <div class="skill-progress">
                    <div class="skill-progress-fill" style="width: ${skill.progress}%"></div>
                </div>
                <div style="text-align: right; margin-top: 5px; font-size: 0.8rem; color: var(--text-light); opacity: 0.8;">
                    ${skill.xp} / ${skill.xpRequired} XP
                </div>
            </div>
        `).join('');
    },

    // Update Processing Queue
    updateProcessingQueue() {
        const queue = document.getElementById('processing-queue');
        if (!queue) return;

        if (!this.data.processingQueue || this.data.processingQueue.length === 0) {
            queue.innerHTML = '<div style="color: var(--text-light); text-align: center; padding: 40px;">No items in processing queue</div>';
            return;
        }

        queue.innerHTML = this.data.processingQueue.map(item => `
            <div class="stat-row" style="margin-bottom: 10px;">
                <div>
                    <div style="font-weight: bold;">${item.name}</div>
                    <div style="font-size: 0.8rem; opacity: 0.8;">Amount: ${item.amount}</div>
                </div>
                <div style="text-align: right;">
                    <div style="color: var(--accent-gold);">Status: ${item.status}</div>
                    <div style="font-size: 0.8rem;">${item.progress}%</div>
                </div>
            </div>
        `).join('');
    },

    // Update Tab Data
    updateTabData(tab, data) {
        switch (tab) {
            case 'workers':
                this.data.workers = data;
                this.updateWorkers();
                break;
            case 'skills':
                this.data.skills = data;
                this.updateSkills();
                break;
            case 'processing':
                this.data.processingQueue = data;
                this.updateProcessingQueue();
                break;
        }
    },

    // Show Notification
    notify(message, type = 'info') {
        const notifications = document.getElementById('notifications');
        const notification = document.createElement('div');
        notification.className = `notification ${type}`;
        notification.textContent = message;
        
        notifications.appendChild(notification);

        // Auto remove after configured duration
        setTimeout(() => {
            notification.style.animation = `slideInRight ${this.NOTIFICATION_FADE_DURATION}ms ease-out reverse`;
            setTimeout(() => {
                notification.remove();
            }, this.NOTIFICATION_FADE_DURATION);
        }, this.NOTIFICATION_DURATION);
    },

    // Send NUI Message
    sendNUIMessage(action, data = {}) {
        fetch(`https://${GetParentResourceName()}/${action}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        }).catch(err => {
            console.log('NUI Callback Error:', err);
        });
    }
};

// Helper function for resource name
function GetParentResourceName() {
    let resourceName = 'tlw-woodwork';
    
    // Try to get resource name from NUI context (for FiveM/RedM)
    try {
        if (typeof window.GetParentResourceName === 'function') {
            resourceName = window.GetParentResourceName();
        }
    } catch (e) {
        console.log('Running in browser mode');
    }
    
    return resourceName;
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    WoodworkUI.init();
    console.log('Woodwork UI Ready');
});

// For testing in browser
if (window.location.protocol === 'file:' || window.location.hostname === 'localhost') {
    console.log('Running in test mode');
    
    // Simulate opening UI with test data after 1 second
    setTimeout(() => {
        WoodworkUI.open({
            lumberStock: 1250,
            dailyRevenue: 450,
            workerCount: 3,
            efficiency: 85,
            licenseType: 'Medium',
            campLevel: 2,
            monthlyCosts: 250,
            workers: [
                {
                    name: 'John Smith',
                    type: 'camp_manager',
                    efficiency: 80,
                    wage: 20
                },
                {
                    name: 'William Brown',
                    type: 'sawmill_operator',
                    efficiency: 75,
                    wage: 15
                },
                {
                    name: 'Robert Wilson',
                    type: 'guard',
                    efficiency: 90,
                    wage: 25
                }
            ],
            skills: [
                {
                    name: 'Woodcutting',
                    level: 5,
                    progress: 65,
                    xp: 650,
                    xpRequired: 1000
                },
                {
                    name: 'Processing',
                    level: 3,
                    progress: 40,
                    xp: 400,
                    xpRequired: 1000
                },
                {
                    name: 'Business Management',
                    level: 2,
                    progress: 20,
                    xp: 200,
                    xpRequired: 1000
                }
            ],
            processingQueue: [
                {
                    name: 'Oak Logs',
                    amount: 50,
                    status: 'Processing',
                    progress: 45
                },
                {
                    name: 'Pine Planks',
                    amount: 30,
                    status: 'Queued',
                    progress: 0
                }
            ]
        });
    }, 1000);
}
